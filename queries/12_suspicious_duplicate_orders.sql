/* QA CHECK: Suspicious duplicate orders
   Purpose:
   - Detect potential duplicate orders created by the same user
     with the same total_amount on the same day
   Notes:
   - This is a heuristic: duplicates might be valid in some businesses
*/

SELECT
  o.user_id,
  DATE(o.created_at) AS order_date,
  o.total_amount,
  COUNT(*) AS cnt
FROM orders o
WHERE o.user_id IS NOT NULL
  AND o.total_amount IS NOT NULL
  AND o.created_at IS NOT NULL
GROUP BY o.user_id, DATE(o.created_at), o.total_amount
HAVING COUNT(*) > 1
ORDER BY cnt DESC;