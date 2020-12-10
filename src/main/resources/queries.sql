--- simple
select row_to_json(v.*)
from viking v
limit 10;

-- jointure 1
select row_to_json(d.*), row_to_json(v.*)
from drakkar d
join viking_in_drakkar vdk on d.id = vdk.viking_id
join viking v on v.id = vdk.drakkar_id
where v.name = 'Aasvard';

select row_to_json(d.*), array_agg(row_to_json(v.*))
from drakkar d
join viking_in_drakkar vdk on d.id = vdk.viking_id
join viking v on v.id = vdk.drakkar_id
where v.name = 'Aasvard'
group by d.*;

select row_to_json(d.*)::jsonb || json_build_object('members', array_agg(row_to_json(v.*)))::jsonb
from drakkar d
join viking_in_drakkar vdk on d.id = vdk.viking_id
join viking v on v.id = vdk.drakkar_id
where v.name = 'Aasvard'
group by d.*;

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

-- jointure 2
with drak as (
    select *
    from drakkar d
        limit 10
)
select row_to_json(d.*)::jsonb || json_build_object('members', array_agg(row_to_json(v.*)))::jsonb
from drak d
 join viking_in_drakkar vdk on d.id = vdk.viking_id
 join viking v on v.id = vdk.drakkar_id
group by d.*;


-------------- JSON --------------

-- jointure 1 json

select d.json::jsonb || json_build_object('chief', chief.json)::jsonb || json_build_object('members', array_agg(v.json))::jsonb
from drakkar_json d
join viking_json chief on chief.id = d.json ->> 'chief_id'
join viking_in_drakkar_json vdk on d.id = vdk.viking_id
join viking_json v on v.id = vdk.drakkar_id
where v.json @> '{"name":"Aasvard"}'
group by d.json, chief.json;

-- jointure json v2
select
        d.json ||
        json_build_object('members',
                          array(select v.json
                                from viking_in_drakkar_json vdk
                                 join viking_json v on v.id = vdk.drakkar_id
                                where d.id = vdk.viking_id
                              ))::jsonb
from drakkar_json d
limit 10;


-- jointure json v3
select
            d.json ||
            json_build_object('chief', (select v.json from viking_json v where d.json ->> 'chief_id' = v.id ))::jsonb ||
            json_build_object('members',
                              array(select v.json
                                    from viking_in_drakkar_json vdk
                                             join viking_json v on v.id = vdk.drakkar_id
                                    where d.id = vdk.viking_id
                                  ))::jsonb
from drakkar_json d
limit 10;