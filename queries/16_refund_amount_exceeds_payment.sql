/* QA CHECK: Refund amount exceeds payment amount
   Purpose:
   - Detect invalid money flows: refund_total > paid_total
   Expected result:
   - 0 rows
Notes:
   - Assumes refunds table has payment_id OR order_id.
   - If your schema differs, tell me your columns and I'll adapt it.
*/

WITH paid AS (
  SELECT
    p.id        AS payment_id,
    p.order_id,
    SUM(p.amount) AS paid_total
  FROM payments p
  GROUP BY p.id, p.order_id
),
refunded AS (
  SELECT
    r.payment_id,
    r.order_id,
    SUM(r.amount) AS refund_total
  FROM refunds r
  GROUP BY r.payment_id, r.order_id
)
SELECT
  COALESCE(ref.payment_id, paid.payment_id) AS payment_id,
  COALESCE(ref.order_id,   paid.order_id)   AS order_id,
  paid.paid_total,
  ref.refund_total
FROM refunded ref
LEFT JOIN paid
  ON (ref.payment_id IS NOT NULL AND paid.payment_id = ref.payment_id)
  OR (ref.payment_id IS NULL AND ref.order_id IS NOT NULL AND paid.order_id = ref.order_id)
WHERE paid.paid_total IS NOT NULL
  AND ref.refund_total > paid.paid_total
ORDER BY ref.refund_total - paid.paid_total DESC;