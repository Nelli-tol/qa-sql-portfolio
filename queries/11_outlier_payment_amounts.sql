/* QA CHECK: Outlier payment amounts (basic rules)
   Purpose:
   - Detect invalid or suspicious payment amounts
   - Negative / zero amounts usually indicate data issues
   - Extremely large amounts might be corrupt data or wrong currency
   Expected result:
   - 0 rows (or reviewed exceptions)
*/

SELECT
  p.id        AS payment_id,
  p.order_id,
  p.amount,
  p.created_at
FROM payments p
WHERE p.amount IS NULL
   OR p.amount <= 0
   OR p.amount > 100000;   -- adjust threshold if needed