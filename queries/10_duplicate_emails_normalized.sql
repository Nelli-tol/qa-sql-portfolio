/* QA CHECK: Duplicate emails after normalization
   Purpose:
   - Detect duplicates ignoring case and accidental spaces
   Why:
   - "Test@Mail.com" and " test@mail.com " should be treated as same user in many systems
*/

SELECT
  LOWER(TRIM(email)) AS normalized_email,
  COUNT(*) AS cnt
FROM users
WHERE email IS NOT NULL
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;