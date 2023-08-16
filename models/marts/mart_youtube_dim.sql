select 
    video_id,
    date_published,
    video_title,
    video_tags,
    does_video_have_caption
from 
    {{ref('int_youtube')}}