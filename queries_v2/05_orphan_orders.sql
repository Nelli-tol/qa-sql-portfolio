/* ============================================================
   QA CHECK: Orphan orders (orders referencing missing users)
   Purpose:
     - Find orders where user_id does not exist in users.id
   Expected:
     - 0 rows returned
   ============================================================ */

SELECT
  o.id      AS order_id,
  o.user_id AS missing_user_id
FROM orders o
LEFT JOIN users u
  ON u.id = o.user_id
WHERE o.user_id IS NOT NULL
  AND u.id IS NULL
ORDER BY o.id;