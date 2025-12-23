/* ============================================================
   QA CHECK: NULLs in critical fields
   Purpose:
     - Find rows where mandatory fields are missing
   Expected:
     - 0 rows returned
   ============================================================ */

SELECT
  id,
  email,
  created_at
FROM users
WHERE id IS NULL
   OR email IS NULL
   OR created_at IS NULL;