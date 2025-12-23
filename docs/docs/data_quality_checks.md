# Data Quality Checks — QA Perspective

This document explains the purpose of SQL checks used in this portfolio.

## 1. Row Count Sanity Check
**Purpose:**  
Verify that a table is not empty after data loading.

**Why it matters:**  
Empty tables often indicate failed ETL/ELT jobs or broken pipelines.

---

## 2. NULL Checks for Critical Fields
**Purpose:**  
Detect missing values in mandatory columns (IDs, emails, timestamps).

**Why it matters:**  
NULLs in critical fields can break business logic, analytics, or application behavior.

---

## 3. Duplicate Records
**Purpose:**  
Find duplicate values in fields expected to be unique (e.g., email).

**Why it matters:**  
Duplicates can cause incorrect reports, login issues, or billing errors.

---

## 4. Invalid Email Format
**Purpose:**  
Detect obviously invalid email values using simple heuristics.

**Why it matters:**  
Bad input validation often leaks into production and affects communication systems.

---

## 5. Orphan Records
**Purpose:**  
Find records referencing missing parent entities (e.g., orders without users).

**Why it matters:**  
Orphan records indicate broken relationships or missing foreign key enforcement.

---

## 6. Date Logic Validation
**Purpose:**  
Detect timestamps that violate logical constraints (e.g., future creation dates).

**Why it matters:**  
Incorrect timestamps can break analytics, reports, and time-based logic.