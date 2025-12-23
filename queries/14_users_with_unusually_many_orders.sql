/* QA CHECK: Users with unusually high order volume
   Purpose:
   - Detect potential duplicates, bots, fraud, or join/data issues
   - Shows users whose order_count is far above average
   Method:
   - Flag users with count > (avg + 3*stddev)
   Notes:
   - STDDEV function name may vary by DB (STDDEV, STDDEV_POP, STDDEV_SAMP)
*/

WITH user_order_counts AS (
  SELECT
    o.user_id,
    COUNT(*) AS order_count
  FROM orders o
  WHERE o.user_id IS NOT NULL
  GROUP BY o.user_id
),
stats AS (
  SELECT
    AVG(order_count)   AS avg_cnt,
    STDDEV(order_count) AS std_cnt
  FROM user_order_counts
)
SELECT
  uoc.user_id,
  uoc.order_count,
  s.avg_cnt,
  s.std_cnt
FROM user_order_counts uoc
CROSS JOIN stats s
WHERE uoc.order_count > (s.avg_cnt + 3 * s.std_cnt)
ORDER BY uoc.order_count DESC;