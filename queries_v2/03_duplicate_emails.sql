/* ============================================================
   QA CHECK: Duplicate emails (should be unique)
   Purpose:
     - Detect duplicates for a field expected to be unique
   Expected:
     - 0 rows returned
   Notes:
     - ignores NULL emails
   ============================================================ */

SELECT
  email,
  COUNT(*) AS cnt
FROM users
WHERE email IS NOT NULL
GROUP BY email
HAVING COUNT(*) > 1
ORDER BY cnt DESC, email;