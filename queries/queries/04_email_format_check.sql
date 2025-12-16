/* QA CHECK: invalid email format (simple heuristic) */
SELECT
  id, email
FROM users
WHERE email NOT LIKE '%@%';