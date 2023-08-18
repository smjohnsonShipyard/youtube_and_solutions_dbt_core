with qryDict as (
    SELECT
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
        JSON_EXTRACT_SCALAR(youtube_video, '$.url') as youtube_url
    FROM
        {{ref('stg_solutions')}}
),
qryYtID as (
    SELECT
        *,
        substr(youtube_url,STRPOS(youtube_url,'=')+1) as youtube_video_id
    FROM
        qryDict
)
SELECT
    *
FROM
    qryYtID