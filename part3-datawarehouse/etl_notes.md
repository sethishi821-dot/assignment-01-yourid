# ETL Notes

## 1. Date Standardization
Problem:
Raw data had inconsistent date formats.

Solution:
Converted all dates into a standard YYYY-MM-DD format and created a separate date dimension.

---

## 2. Handling NULL Values
Problem:
Some fields had missing values.

Solution:
Replaced NULL values with default values or removed incomplete records.

---

## 3. Category Standardization
Problem:
Category names had inconsistent casing (e.g., electronics, Electronics).

Solution:
Standardized all category names into consistent format (e.g., Electronics, Clothing, Groceries).

---

## Conclusion
These transformations ensured clean, consistent, and reliable data for analysis in the data warehouse.
