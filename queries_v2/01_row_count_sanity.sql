/* ============================================================
   QA CHECK: Row count sanity check
   Purpose:
     - Basic validation that the table is not empty
     - Useful after ETL/ELT loads
   Expected result:
     - total_rows > 0
   ============================================================ */

SELECT
  COUNT(*) AS total_rows
FROM users;