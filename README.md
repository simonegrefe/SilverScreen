# **SilverScreen Project**

## **Project Overview**

**Silver Screen** is a major entertainment company that recently acquired a chain of movie theaters in New Jersey.

The company wanted to find out about the efficiency of the three theater locations, specifically about the relationship between movie rental costs and revenue from ticket sales generated.

---

## **Objectives**

The final objective was to create a table that \*\***summarizes monthly performance\*\*** for each movie across all locations, including

- movie details
- location information
- monthly rental costs for each movie
- total ticket sales for each movie at each location
- total revenue generated from ticket sales for each movie at each location.

---

## **Data Sources**

The project used five data sources as csv files with different structures:

| **table name**  | **description**                                                                                                  |
| --------------- | ---------------------------------------------------------------------------------------------------------------- |
| movie_catalogue | contains detailed information about movies released in 2024 and rented out by Silver Screen                      |
| invoices        | represents the invoices issued for showing a specific movie at various theater locations during different months |
| nj_001          | contains information on all transactions from location 1                                                         |
| nj_002          | contains daily sales information from location 2                                                                 |
| nj_003          | tracks individual purchases from location 3, covering various product types such as tickets, snacks, and drinks  |

---

## **Transformation Process**

Following steps were performed in **dbt** and executed on **Snowflake**:

### 1. **Cleaning the movie information**

Created staging model to refine table containing movie_id, movie_title, studio and replace _NULLS_ for genre with 'Unknown' to ensure data consistency.

### 2. **Clean and Standardize column names in invoices**

Created staging model to standardize column name from total_invoice_sum to rental_cost and aggregate using MIN due to synthetic data anomalies.

### 3. **Normalized location data**

Created staging models for each location, filtered location No. 3 for only tickets and transformed each NJ location dataset into a consistent structure, aggregated at a monthly level and to a overall total for `tickets_sold`, `revenue` for each movie at each location within a specific month.

### 4. **Unified location data**

Unified all locations into a single intermediate model to obtain a comprehensive view of ticket sales and revenue.

### 5. **Combined invoices and movie information**

Joined invoice and movie details to the location sales tables into a intermediate model.

### 6. **Merge rental costs**

Creating the final model, integrated monthly rental cost data for each location with the corresponding monthly revenue and ticket sales information and provided the gross margin.

---

## **Custom dbt Tests**

Besides generic tests `not_null`, `unique` and `relationships` three singular tests were created to ensure:

- data for tickets sold are integer
- rental costs are not negative
- revenue is not negative

---

## **Usage**

The project helps to understand the **financial performance** for each movie across all locations per month to:

- track monthly profitability per movie and location by comparing rental costs to revenue
- identify which of the three theaters is generating the most revenue
- analyze revenue and rental costs across months to detect seasonality or performance spikes
- spot underperforming theaters where rental costs are high but ticket sales are weak

---

## **Tools**

This project leverages the following technologies:

- **dbt (Data Build Tool)**: For data transformation, modeling, and testing
- **Snowflake**: A cloud-based data warehouse for storing and querying analytical data
- **SQL**: The primary language for transforming, aggregating, and analyzing data within dbt models
- **Git**: Provides version control to manage and track changes to models, tests, and project configurations
