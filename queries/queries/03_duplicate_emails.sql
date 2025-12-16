/* QA CHECK: duplicates in a field expected to be unique */
SELECT
  email,
  COUNT(*) AS cnt
FROM users
GROUP BY email
HAVING COUNT(*) > 1;