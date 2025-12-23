/* QA CHECK: Orphan payments (payments referencing missing orders)
   Purpose:
   - Detect payments that reference orders that do not exist
   Expected result:
   - 0 rows
*/

SELECT
  p.id      AS payment_id,
  p.order_id,
  p.amount,
  p.created_at
FROM payments p
LEFT JOIN orders o ON o.id = p.order_id
WHERE o.id IS NULL;