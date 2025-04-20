with src_listings as
(
    select * from {{ ref('src_listings') }}
)
select listing_id,
listing_name,
listing_url,
ROOM_TYPE,
case when minimum_nights =0 then 1 else minimum_nights end as minimum_nights,
host_id,
replace(price_STR,'$','') :: NUMBER(
    10,
    2
  ) AS price,
created_at,
updated_at
from airbnb.dev.src_listings