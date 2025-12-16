/* QA CHECK: orphan records (orders referencing missing users) */
SELECT
  o.id AS order_id,
  o.user_id
FROM orders o
LEFT JOIN users u ON u.id = o.user_id
WHERE u.id IS NULL;