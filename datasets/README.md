# Datasets

This folder describes example datasets used for SQL QA checks.

Actual data files are not included.
The focus of this portfolio is on SQL logic and data validation techniques.

## Example Tables

### users
- id (primary key)
- email
- created_at

### orders
- id (primary key)
- user_id (references users.id)
- created_at
- total_amount

### payments
- id (primary key)
- order_id (references orders.id)
- amount
- created_at

These tables simulate a typical production environment used in QA testing.
