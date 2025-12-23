/* QA CHECK: Duplicate order_number (should be unique)
   Purpose:
   - Detect duplicates in business key order_number
   Expected result:
   - 0 rows
Assumptions:
   - orders has column: order_number
*/

SELECT
  o.order_number,
  COUNT(*) AS cnt
FROM orders o
WHERE o.order_number IS NOT NULL
GROUP BY o.order_number
HAVING COUNT(*) > 1
ORDER BY cnt DESC, o.order_number;