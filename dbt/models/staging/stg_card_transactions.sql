{{ config(
    materialized='view',
    schema='STAGING'
) }}


select
    transaction_id,

    coalesce(cast(amount as number(10,2)), 0) as amount,

    cast(transaction_hour as integer) as transaction_hour,

    coalesce(upper(trim(merchant_category)), 'UNKNOWN') as merchant_category,

    cast(foreign_transaction as boolean) as foreign_transaction,
    cast(location_mismatch as boolean) as location_mismatch,

    cast(device_trust_score as integer) as device_trust_score,
    cast(velocity_last_24h as integer) as velocity_last_24h,
    cast(cardholder_age as integer) as cardholder_age,

    case
        when is_fraud = 1 then true
        when is_fraud = 0 then false
        else false
    end as is_fraud

from {{ source('raw', 'card_transactions') }}

where transaction_id is not null
