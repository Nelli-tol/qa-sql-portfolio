/* =========================================================
   QA CHECK: NULL values in critical fields
   Purpose:
   Detect records where mandatory fields are missing.
   Such cases usually indicate data pipeline or validation issues.
   ========================================================= */

-- Example table: users
-- Critical fields: id, email, created_at

SELECT *
FROM users
WHERE id IS NULL
   OR email IS NULL
   OR created_at IS NULL;
