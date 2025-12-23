# QA SQL Portfolio — Data Quality Checks

A portfolio-style repository with **QA / Data QA** focused SQL checks for validating data quality after data loads (ETL/ELT) or backend changes.

The goal is to demonstrate a QA mindset:
- detect data issues quickly
- validate integrity between tables
- catch broken business rules early

---

## Repository structure

- `queries/` — SQL QA checks (standalone `.sql` files)
- `docs/` — explanations of data quality checks and QA reasoning
- `datasets/` — minimal sample datasets (CSV) for demonstration

---

## Highlights (what this repo covers)

### Core validation
- table sanity checks (row counts)
- NULL checks for critical fields
- duplicates (raw + normalized)
- basic format validation

### Integrity & relationships
- orphan records (orders without users, payments without orders)

### Business rules / reconciliation
- order totals vs sum(order_items)
- payments reconciliation vs order totals
- suspicious duplicate orders

### Anomaly detection
- outlier payment amounts
- unusually high order volume per user

### Status validation
- invalid order status values
- invalid status transitions (when status history exists)

---

## How to use

1. Open any file in `queries/`
2. Replace table/column names if needed
3. Run the query in your SQL environment (PostgreSQL/MySQL/SQLite may need minor tweaks)
4. Review results:
   - Most checks are expected to return **0 rows**
   - Returned rows indicate potential data issues to investigate

---

## Notes

- Email checks are **heuristics**, not full RFC validation.
- Some checks assume optional tables (e.g., `order_items`, `refunds`, `order_status_history`).
  If your schema differs, adjust table/column names accordingly.