--- simple
select row_to_json(*)
from viking
limit 10;


-- jointure 1
select row_to_json(d.*)::jsonb || json_build_object('members', array_agg(row_to_json(v.*)))::jsonb
from drakkar d
         join viking_in_drakkar vdk on d.id = vdk.viking_id
         join viking v on v.id = vdk.drakkar_id
where v.name = 'Aasvard'
group by d.*;

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
select d.json::jsonb || json_build_object('members', array_agg(v.json))::jsonb
from drakkar_json d
         join viking_in_drakkar_json vdk on d.id = vdk.viking_id
         join viking_json v on v.id = vdk.drakkar_id
where v.json @> '{"name":"Aasvard"}'
group by d.json;