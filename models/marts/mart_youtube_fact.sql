select 
    video_id,
    video_view_count,
    video_like_count,
    video_comment_count
from 
    {{ref('int_youtube')}}