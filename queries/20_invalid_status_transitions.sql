/* QA CHECK: Invalid order status transitions (simplified)
   Purpose:
   - Detect orders that "jump" to a later status without intermediate steps
   - Useful when you store status history
   Expected result:
   - 0 rows (or reviewed exceptions)
Assumptions:
   - order_status_history table exists:
       order_id, status, changed_at
   - statuses follow typical flow:
       pending -> paid -> shipped -> delivered
       canceled can happen from pending/paid
*/

WITH ordered_history AS (
  SELECT
    h.order_id,
    h.status,
    h.changed_at,
    LAG(h.status) OVER (PARTITION BY h.order_id ORDER BY h.changed_at) AS prev_status
  FROM order_status_history h
),
violations AS (
  SELECT
    order_id,
    prev_status,
    status AS current_status,
    changed_at
  FROM ordered_history
  WHERE prev_status IS NOT NULL
    AND (
      -- jumping forward
      (prev_status = 'pending'  AND current_status IN ('shipped','delivered'))
      OR (prev_status = 'paid'  AND current_status = 'delivered')
      -- invalid "backwards" transitions (basic)
      OR (prev_status = 'delivered' AND current_status <> 'delivered')
      OR (prev_status = 'canceled'  AND current_status <> 'canceled')
      -- cancel after shipped/delivered (basic rule)
      OR (prev_status IN ('shipped','delivered') AND current_status = 'canceled')
    )
)
SELECT *
FROM violations
ORDER BY order_id, changed_at;