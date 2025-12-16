/* QA CHECK: NULLs in critical fields */
SELECT
  COUNT(*) AS null_email_count
FROM users
WHERE email IS NULL;