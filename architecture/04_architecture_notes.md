# Architecture Overview

This project implements a banking-style fraud analytics platform using a modern ELT architecture.

## Components
- Source data: Anonymized card transaction CSV files
- Storage: AWS S3 as landing zone
- Data warehouse: Snowflake
- Transformation: dbt (staging and mart layers)
- Analytics: Power BI

## Data Layers
- RAW: Source-aligned, append-only tables
- STAGING: Cleaned and standardized data
- MART: Business-ready fact and dimension tables
- SECURE: Secure views exposed to BI users

## Security
- Role-based access control (RBAC)
- Secure views for BI access
- Masking policies on sensitive attributes

## Orchestration
- Snowpipe for event-driven ingestion
- dbt Cloud for transformation scheduling
