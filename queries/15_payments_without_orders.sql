/* QA CHECK: Orphan payments (payments referencing missing orders)
   Purpose:
   - Detect payments that point to non-existent orders
   Expected result:
   - 0 rows
*/

SELECT
  p.id        AS payment_id,
  p.order_id,
  p.user_id,
  p.amount,
  p.created_at
FROM payments p
LEFT JOIN orders o
  ON o.id = p.order_id
WHERE p.order_id IS NOT NULL
  AND o.id IS NULL;