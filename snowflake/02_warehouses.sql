create or replace warehouse INGEST_WH
warehouse_size = 'XSMALL'
auto_suspend = 60
auto_resume = true
initially_suspended = true;

create or replace warehouse TRANSFORM_WH
warehouse_size = 'SMALL'
auto_suspend = 300
auto_resume = true
initially_suspended = true;

create or replace warehouse BI_WH
warehouse_size = 'SMALL'
auto_suspend = 300
auto_resume = true
initially_suspended = true;

show warehouses;
