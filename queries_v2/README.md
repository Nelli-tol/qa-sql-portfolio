# SQL QA Checks (v2)

This folder contains small **data quality / QA** SQL checks you can run after loading a dataset.

## How to use
Run each `.sql` file in your SQL environment (PostgreSQL / SQLite / MySQL may need small tweaks).

**Expected outcome:** most checks should return **0 rows**.  
If rows are returned — those are the records to investigate/fix.

## Checks included
1. **01_row_count_sanity.sql** — basic sanity: table is not empty  
2. **02_null_checks_critical.sql** — NULLs in mandatory fields (users)  
3. **03_duplicate_emails.sql** — duplicates in a unique field (email)  
4. **04_invalid_email_format.sql** — obvious invalid email patterns  
5. **05_orphan_orders.sql** — orders referencing missing users  
6. **06_future_order_dates.sql** — timestamps in the future (orders)

## Notes
- Email validation here is a **heuristic**, not a full RFC validator.
- These checks are designed to be readable and portfolio-friendly.