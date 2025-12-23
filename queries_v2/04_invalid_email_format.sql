/* ============================================================
   QA CHECK: Invalid email format (simple heuristic)
   Purpose:
     - Catch obvious invalid emails (not a full RFC validator)
   Expected:
     - 0 rows returned (or very low)
   ============================================================ */

SELECT
  id,
  email
FROM users
WHERE email IS NOT NULL
  AND (
    email NOT LIKE '%@%'      -- must contain @
    OR email LIKE '% %'       -- no spaces
    OR email LIKE '@%'        -- cannot start with @
    OR email LIKE '%@'        -- cannot end with @
    OR email NOT LIKE '%.%'   -- must contain a dot somewhere (basic)
  );