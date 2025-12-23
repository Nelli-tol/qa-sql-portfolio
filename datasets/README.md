# Sample Datasets

This folder contains **small demo CSV datasets** used to illustrate SQL QA checks
from the `queries/` folder.

The datasets intentionally include **data quality issues** so that SQL checks
return meaningful results.

---

## users.csv
Columns:
- id
- email
- created_at

Embedded issues:
- NULL email values
- duplicate emails (case + whitespace differences)
- invalid email formats

Used by checks:
- NULL validation
- duplicate detection (raw & normalized)
- basic format validation

---

## orders.csv
Columns:
- id
- order_number
- user_id
- status
- created_at
- total / total_amount

Embedded issues:
- orphan orders (user_id not found in users)
- duplicate order_number values
- future timestamps
- invalid status values
- suspicious duplicate orders (same user, same amount, close timestamps)

Used by checks:
- referential integrity
- order number uniqueness
- date logic validation
- status validation
- anomaly detection

---

## payments.csv
Columns:
- id
- order_id
- user_id
- amount
- created_at

Embedded issues:
- orphan payments (order_id not found)
- zero and negative amounts
- extreme outlier amounts
- partial payments

Used by checks:
- orphan payment detection
- payment reconciliation
- outlier amount detection
- non-positive amount validation

---

## order_items.csv
Columns:
- id
- order_id
- unit_price
- quantity
- created_at

Embedded issues:
- negative unit_price
- order totals not matching sum of items

Used by checks:
- order total reconciliation
- non-positive amount validation

---

## Notes
These datasets are **not meant for production use**.
They exist solely to demonstrate QA-oriented SQL validation logic
in a compact and readable way.
