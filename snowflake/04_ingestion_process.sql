use role ingest_role;
use database BANK_FRAUD_ANALYTICS.RAW;

create or replace stage s3_raw_data
url = 's3://bank-fraud-raw-data/'
credentials = (
aws_key_id = '#############'
aws_secret_key = '################################'
);

list @S3_RAW_DATA; 

create or replace table BANK_FRAUD_ANALYTICS.RAW.card_transactions (
    transaction_id        number,
    amount                number(10,2),
    transaction_hour      number,
    merchant_category     string,
    foreign_transaction   number,
    location_mismatch     number,
    device_trust_score    number,
    velocity_last_24h     number,
    cardholder_age        number,
    is_fraud              number
);

show tables in schema BANK_FRAUD_ANALYTICS.RAW;


copy into BANK_FRAUD_ANALYTICS.RAW.card_transactions
from @s3_raw_data
file_format = (format_name = 'csv_raw_data')

select * from BANK_FRAUD_ANALYTICS.RAW.card_transactions limit 5;






