/* QA CHECK: Orders without payments
   Purpose:
   - Detect orders that have no payments (possible missing transactions)
   Notes:
   - If your model allows unpaid orders, treat this as "review needed"
*/

SELECT
  o.id        AS order_id,
  o.user_id,
  o.total_amount,
  o.created_at
FROM orders o
LEFT JOIN payments p ON p.order_id = o.id
WHERE p.id IS NULL;