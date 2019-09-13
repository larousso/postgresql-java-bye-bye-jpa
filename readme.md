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