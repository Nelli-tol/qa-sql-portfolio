/* QA CHECK: Order total mismatch
   Purpose:
   - Validate that orders.total matches the sum of order_items (price * quantity)
   Expected result:
   - 0 rows (or only expected rounding differences)
Assumptions:
   - orders: id, total
   - order_items: order_id, unit_price, quantity
*/

WITH item_totals AS (
  SELECT
    oi.order_id,
    SUM(COALESCE(oi.unit_price, 0) * COALESCE(oi.quantity, 0)) AS items_total
  FROM order_items oi
  GROUP BY oi.order_id
)
SELECT
  o.id AS order_id,
  o.total AS order_total,
  it.items_total,
  (o.total - it.items_total) AS diff
FROM orders o
JOIN item_totals it
  ON it.order_id = o.id
WHERE o.total IS NULL
   OR it.items_total IS NULL
   OR ABS(o.total - it.items_total) > 0.01
ORDER BY ABS(o.total - it.items_total) DESC;