/* QA CHECK: Invalid order status values
   Purpose:
   - Detect orders with missing/unknown status
   - Helps catch ETL issues or bad enums
   Expected result:
   - 0 rows (or only known legacy statuses)
*/

SELECT
  o.id        AS order_id,
  o.user_id,
  o.status,
  o.created_at
FROM orders o
WHERE o.status IS NULL
   OR o.status NOT IN ('pending', 'paid', 'shipped', 'delivered', 'canceled');