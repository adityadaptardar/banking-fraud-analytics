{{ config(
    materialized='table',
    schema='MART'
) }}

select
    -- Business key
    s.transaction_id,

    -- Dimension keys
    m.merchant_key,
    c.cardholder_key,
    t.transaction_hour,

    -- Measures
    s.amount,
    s.is_fraud,
    s.foreign_transaction,
    s.location_mismatch,
    s.velocity_last_24h,
    s.device_trust_score

from {{ ref('stg_card_transactions') }} s

left join {{ ref('dim_merchant') }} m
    on s.merchant_category = m.merchant_category

left join {{ ref('dim_cardholder') }} c
    on s.cardholder_age = c.cardholder_age

left join {{ ref('dim_transaction_time') }} t
    on s.transaction_hour = t.transaction_hour
