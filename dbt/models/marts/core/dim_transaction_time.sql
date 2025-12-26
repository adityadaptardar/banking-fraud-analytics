{{ config(
    materialized='table',
    schema='MART'
) }}


select distinct
    transaction_hour,
    case
        when transaction_hour between 0 and 5 then 'Night'
        when transaction_hour between 6 and 11 then 'Morning'
        when transaction_hour between 12 and 17 then 'Afternoon'
        else 'Evening'
    end as time_bucket
from {{ ref('stg_card_transactions') }}
