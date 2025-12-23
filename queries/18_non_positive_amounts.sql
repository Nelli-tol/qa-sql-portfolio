/* QA CHECK: Non-positive amounts / quantities
   Purpose:
   - Detect impossible values (amount <= 0, quantity <= 0, unit_price <= 0)
   Expected result:
   - 0 rows (unless your business rules allow freebies)
*/

-- Payments amount <= 0
SELECT
  'payments' AS source_table,
  p.id AS record_id,
  p.amount,
  p.created_at
FROM payments p
WHERE p.amount IS NULL
   OR p.amount <= 0

UNION ALL

-- Refunds amount <= 0
SELECT
  'refunds' AS source_table,
  r.id AS record_id,
  r.amount,
  r.created_at
FROM refunds r
WHERE r.amount IS NULL
   OR r.amount <= 0

UNION ALL

-- Order items bad values
SELECT
  'order_items' AS source_table,
  oi.id AS record_id,
  (COALESCE(oi.unit_price, 0) * COALESCE(oi.quantity, 0)) AS amount,
  oi.created_at
FROM order_items oi
WHERE oi.unit_price IS NULL OR oi.unit_price <= 0
   OR oi.quantity   IS NULL OR oi.quantity   <= 0;