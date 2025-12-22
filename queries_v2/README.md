# SQL QA Portfolio — Data Validation Queries (v2)

This folder contains small, focused SQL checks a QA/Data QA can run to validate data quality after ETL/ELT loads.

## How to use
- Each file is a standalone check.
- Replace table/column names to match your schema.
- Run the query and review the result set (or counts).
- If the query returns rows (or a non-zero count where it should be zero), it indicates a potential data quality issue.

## What’s inside
1. Row count sanity check  
2. NULL checks for critical fields  
3. Duplicate detection for fields that must be unique  
4. Basic format validation (email heuristic)  
5. Orphan records (FK-like validation)  
6. Date logic (timestamps should not be in the future)

## Notes
- Queries are written to be mostly ANSI SQL, with minor differences depending on the database.
- For production work, these checks can be automated and scheduled.