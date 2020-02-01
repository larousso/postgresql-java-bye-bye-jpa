# Postgresql + json : bye bye JPA et passe le bonjour à mongo

## Abstract du talk 


* Quelqu'un : Les ORMs c'est vraiment de la @%ù%$, franchement moi j'en utilise pas
* Moi : à ouais tu utilises quoi alors? Par exemple pour gérer ton mapping objet quand il y a des relations
* Quelqu'un : Au fait, t'as pensé quoi du dernier épisode de game of throne ?

Une des features star de JPA, c'est la possibilité de mapper les relations entre objets. Malheureusement tout le monde sait que cette feature amène aussi beaucoup de souffrance.

Dans ce talk 100% (ouais ok 80%) live coding, je vous proposerai une alternative à JPA en utilisant le support json de postgresql. 
On parlera requêtage json, aggrégations json et on ira jusqu'à stocker et indexer du json voir même faire des jointures entre json. 
Tout ça afin de pouvoir gérer facilement le mapping objet côté java. 

## Utiliser le projet 

Pré-requis : 

 * java 13 
 * docker 
 
 ```bash 
docker-compose up 
gradle compileJava 
gradle run  
```

Dans intellij il faut activer les features java "preview". 

## Le modèle de données 

```sql
create table IF NOT EXISTS viking (
    "id" text primary key,
    "name" text,
    "lastName" text,
    "gender" text,
    "numberOfBattles" int,
    "birthDate" date
);

create index viking_name_idx on viking("name");

create table IF NOT EXISTS drakkar(
    "id" text primary key,
    "name" text,
    "chief_id" text references viking("id")
);
a
create table IF NOT EXISTS viking_in_drakkar(
    "id" text primary key,
    "viking_id" text references viking(id),
    "drakkar_id" text references drakkar(id),
    unique("viking_id", "drakkar_id")
);
```

en json 

```sql
create table IF NOT EXISTS viking_json (
    id text primary key,
    json jsonb not null
);

CREATE INDEX viking_json_idx ON viking_json using gin (json);


create table IF NOT EXISTS drakkar_json(
    "id" text primary key,
    json jsonb not null
);

CREATE INDEX drakkar_json_idx ON drakkar_json using gin (json);

create table IF NOT EXISTS viking_in_drakkar_json(
    "id" text primary key,
    "viking_id" text references viking_json(id),
    "drakkar_id" text references drakkar_json(id),
    unique("viking_id", "drakkar_id")
);
```

## Les requêtes 

### Modèle classique 

```sql
select row_to_json(d.*)::jsonb || json_build_object('members', array_agg(row_to_json(v.*)))::jsonb
from drakkar d
join viking_in_drakkar vdk on d.id = vdk.viking_id
join viking v on v.id = vdk.drakkar_id
where v.name = 'Aasvard'
group by d.*;
```
ou bien 

```sql
select
        row_to_json(d.*)::jsonb ||
        json_build_object('members',
                          array(select row_to_json(v.*)
                                from viking_in_drakkar vdk
                                         join viking v on v.id = vdk.drakkar_id
                                where d.id = vdk.viking_id
                              ))::jsonb
from drakkar d
limit 10;
```

### Modèle de données json 

```sql
select d.json::jsonb || json_build_object('chief', chief.json)::jsonb || json_build_object('members', array_agg(v.json))::jsonb
from drakkar_json d
join viking_json chief on chief.id = d.json ->> 'chief_id'
join viking_in_drakkar_json vdk on d.id = vdk.viking_id
join viking_json v on v.id = vdk.drakkar_id
where v.json @> '{"name":"Aasvard"}'
group by d.json, chief.json;
```