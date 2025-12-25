create or replace role INGEST_ROLE;
create or replace role TRANSFORM_ROLE;
create or replace role BI_READ_ROLE;

grant usage on database BANK_FRAUD_ANALYTICS to role INGEST_ROLE;
grant usage on database BANK_FRAUD_ANALYTICS to role TRANSFORM_ROLE;
grant usage on database BANK_FRAUD_ANALYTICS to role BI_READ_ROLE;

grant usage on schema BANK_FRAUD_ANALYTICS.RAW to role INGEST_ROLE;
grant usage on schema BANK_FRAUD_ANALYTICS.STAGING to role TRANSFORM_ROLE;
grant usage on schema BANK_FRAUD_ANALYTICS.MART to role TRANSFORM_ROLE;
grant usage on schema BANK_FRAUD_ANALYTICS.SECURE to role BI_READ_ROLE;

grant create table on schema  BANK_FRAUD_ANALYTICS.RAW to role INGEST_ROLE;
grant create table, create view on schema BANK_FRAUD_ANALYTICS.STAGING to role TRANSFORM_ROLE;
grant create table, create view on schema BANK_FRAUD_ANALYTICS.MART to role TRANSFORM_ROLE;


grant usage on warehouse INGEST_WH to role INGEST_ROLE;
grant usage on warehouse TRANSFORM_WH to role TRANSFORM_ROLE;
grant usage on warehouse BI_WH to role BI_READ_ROLE;

grant select, insert on all tables in schema BANK_FRAUD_ANALYTICS.RAW to role INGEST_ROLE;
grant select, insert on future tables in schema BANK_FRAUD_ANALYTICS.RAW to role INGEST_ROLE;

grant select on all views in schema BANK_FRAUD_ANALYTICS.SECURE to role BI_READ_ROLE;
grant select on future views in schema BANK_FRAUD_ANALYTICS.SECURE to role BI_READ_ROLE;


grant role INGEST_ROLE to role TRANSFORM_ROLE;
grant role BI_READ_ROLE to role TRANSFORM_ROLE;
