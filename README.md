# **Silver Screen Project**

## **Project Overview**

**Silver Screen** is a major entertainment company that recently acquired a chain of movie theaters in New Jersey.

The company aimed to assess the efficiency of its three theater locations — focusing on the relationship between **movie rental costs** and **revenue from ticket sales**.

---

## **Objectives**

The project’s goal was to build a dbt pipeline that produces a table summarizing **monthly performance** for each movie across all locations, including:

- Movie details
- Location information
- Monthly rental costs
- Total tickets sold per movie and location
- Total revenue generated per movie and location

---

## **Data Sources**

The project used five CSV files with different structures:

| **Table name** | **Description** |
| --- | --- |
| `movie_catalogue` | Contains detailed information about movies released in 2024 and rented out by Silver Screen. |
| `invoices` | Represents the invoices issued for showing a specific movie at various theater locations during different months. |
| `nj_001` | Contains all ticket transactions from location 1. |
| `nj_002` | Contains daily ticket sales information from location 2. |
| `nj_003` | Tracks individual purchases from location 3, filtered to include only ticket transactions. |

---

## **Transformation Process**

All transformations were implemented in **dbt** and executed on **Snowflake**.

### 1. **Clean movie information**

Refined movie data in a staging model (`stg_movie_catalogue`) to select key columns and replace missing `genre` values with `'Unknown'` for consistency.

### 2. **Standardize invoice data**

Created a staging model (`stg_invoices`) to rename and clean columns, standardizing `total_invoice_sum` to `rental_cost` and aggregating using `MIN` to handle synthetic data anomalies.

### 3. **Normalize location data**

Built staging models for each location (`stg_nj_001`, `stg_nj_002`, `stg_nj_003`), filtered non-ticket items, and aggregated data at the monthly level for `tickets_sold` and `revenue`.

### 4. **Unify location datasets**

Combined all three location models into a single intermediate model (`int_nj_monthly_rev`) to consolidate monthly ticket sales and revenue.

### 5. **Combine invoices and movie information**

Joined `stg_invoices` with `stg_movie_catalogue` to enrich each record with movie metadata in the intermediate layer (`int_movies`).

### 6. **Merge rental costs and calculate metrics**

In the final mart model (`mart_monthly_performance`), integrated monthly rental cost data with revenue and ticket sales, and calculated `gross_margin`.

---

## **Custom dbt Tests**

In addition to generic tests (`not_null`, `unique`, `relationships`), three **singular tests** were implemented to ensure data validity:

- **`is_integer_tickets_sold.sql`** → verifies that all ticket counts are integers.
- **`positive_rental_costs.sql`** → checks that rental costs are non-negative.
- **`positive_revenue.sql`** → checks that revenue values are non-negative.

---

## **Usage**

This project enables analysis of **monthly financial performance** for each movie and theater location:

- Track profitability by comparing rental costs and ticket revenue.
- Identify top-performing and underperforming theaters.
- Detect seasonal patterns or performance spikes across months.
- Highlight movies with high rental costs but low ticket sales.

---

## **Tools**

This project leverages the following technologies:

- **dbt (Data Build Tool):** Data transformation, modeling, and testing.
- **Snowflake:** Cloud-based data warehouse for scalable storage and queries.
- **SQL:** Core language for transformations and aggregations within dbt.
- **Git:** Version control to manage model, test, and documentation changes.

---
