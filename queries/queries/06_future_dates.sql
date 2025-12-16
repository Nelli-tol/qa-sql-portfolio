/* QA CHECK: date logic — created_at should not be in the future */
SELECT
  id, created_at
FROM orders
WHERE created_at > CURRENT_TIMESTAMP;