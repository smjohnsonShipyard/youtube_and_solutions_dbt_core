SELECT
    video_id,
    video_view_count,
    video_like_count,
    video_comment_count
FROM
    {{ref('int_youtube')}}