with qryDict as (
    select 
        name as solution_name,
        description as solution_description,
        synopsis,
        slug,
        primary_blueprint,
        secondary_blueprint,
        integrations_used,
        categories,
        roles,
        youtube_link_embed,
        _cid as collection_id,
        _id,
        youtube_video,
        yaml_definition,
        JSON_EXTRACT_SCALAR(youtube_video, '$.url') AS youtube_url 
    FROM
        {{ref('stg_solutions')}}
),
qryYtId as (
    select 
        *, 
        SUBSTR(youtube_url, STRPOS(youtube_url, '=') + 1) AS youtube_video_id
    FROM
        qryDict
)
select * from qryYtId