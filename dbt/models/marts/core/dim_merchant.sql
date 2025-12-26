{{ config(
    materialized='table',
    schema='MART'
) }}

select distinct
    merchant_category,
    dense_rank() over (order by merchant_category) as merchant_key
from {{ ref('stg_card_transactions') }}
