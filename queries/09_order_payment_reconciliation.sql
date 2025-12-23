/* QA CHECK: Payment reconciliation (sum(payments) must match order total)
   Purpose:
   - Detect mismatches between order.total_amount and sum(payments.amount)
   Expected result:
   - 0 rows (or explained exceptions)
*/

SELECT
  o.id AS order_id,
  o.total_amount,
  COALESCE(SUM(p.amount), 0) AS paid_amount,
  (o.total_amount - COALESCE(SUM(p.amount), 0)) AS diff
FROM orders o
LEFT JOIN payments p ON p.order_id = o.id
GROUP BY o.id, o.total_amount
HAVING o.total_amount <> COALESCE(SUM(p.amount), 0);