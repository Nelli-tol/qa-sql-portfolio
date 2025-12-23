/* ============================================================
   QA CHECK: Future timestamps (created_at should not be future)
   Purpose:
     - Detect bad timestamps caused by ETL/timezone issues
   Expected:
     - 0 rows returned (or explainable edge cases)
   ============================================================ */

SELECT
  id,
  created_at
FROM orders
WHERE created_at > CURRENT_TIMESTAMP
ORDER BY created_at DESC;
