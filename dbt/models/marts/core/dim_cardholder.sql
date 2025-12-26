{{ config(
    materialized='table',
    schema='MART'
) }}


select distinct
    cardholder_age,
    dense_rank() over (order by cardholder_age) as cardholder_key
from {{ ref('stg_card_transactions') }}
