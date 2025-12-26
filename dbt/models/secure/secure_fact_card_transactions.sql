{{ config(
    materialized='view',
    secure=true,
    schema='SECURE'
) }}

select
    transaction_id,
    merchant_key,
    cardholder_key,
    transaction_hour,
    amount,
    is_fraud,
    foreign_transaction,
    location_mismatch,
    velocity_last_24h,
    device_trust_score
from {{ ref('fact_card_transactions') }}
