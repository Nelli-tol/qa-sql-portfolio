/*
QA CHECK: NULL values in critical columns

Purpose:
Detect records where mandatory fields contain NULL values.
Such cases usually indicate data pipeline or validation issues.
*/

-- Example table: users
-- Critical fields: id, email, created_at

SELECT
    *
FROM users
WHERE id IS NULL
   OR email IS NULL
   OR created_at IS NULL;