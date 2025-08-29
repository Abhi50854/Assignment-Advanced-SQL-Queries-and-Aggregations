# Payment and Customer Analysis Queries

This repository contains SQL queries for analyzing payment, customer, and order data from a database. The queries provide insights into payment patterns, customer credit limits, product sales, and payment amounts.

## Queries

### 1. Latest Payment Dates with Total Amounts
```sql
-- Question 1: Total payment amount for each payment date
SELECT 
    paymentDate, 
    SUM(amount) AS total_amount
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate DESC
LIMIT 5;  -- Show only the top 5 latest payment dates
```
This query retrieves the total payment amounts for the 5 most recent payment dates in the database.

### 2. Average Credit Limit by Customer and Country
```sql
-- Question 2: Average credit limit of each customer
SELECT 
    customerName, 
    country, 
    AVG(creditLimit) AS avg_credit_limit
FROM customers
GROUP BY customerName, country;
```
This query calculates the average credit limit for each customer, grouped by customer name and country.

### 3. Product Sales Summary
```sql
-- Question 3: Product sales summary
SELECT 
    productCode, 
    SUM(quantityOrdered) AS total_quantity, 
    SUM(quantityOrdered * priceEach) AS total_price
FROM orderdetails
GROUP BY productCode;
```
This query provides a summary of product sales, showing the total quantity ordered and total revenue for each product.

### 4. Highest Payment Amount by Check Number
```sql
-- Question 4: Highest payment amount for each check number
SELECT 
    checkNumber, 
    MAX(amount) AS highest_amount
FROM payments
GROUP BY checkNumber;
```
This query identifies the highest payment amount associated with each check number in the payments table.

## Database Schema Requirements

These queries assume the following tables and columns exist in the database:

### payments table
- paymentDate (date)
- amount (numeric)
- checkNumber (string)

### customers table
- customerName (string)
- country (string)
- creditLimit (numeric)

### orderdetails table
- productCode (string)
- quantityOrdered (numeric)
- priceEach (numeric)

## Usage

1. Ensure you have a SQL database with the required tables and data
2. Execute the queries individually to get the desired insights
3. Modify the queries as needed for your specific database structure or requirements

## Potential Applications

- Financial reporting and analysis
- Customer credit risk assessment
- Product performance evaluation
- Payment processing analysis

## Notes

- Adjust the `LIMIT` clause in Query 1 if you need to see more or fewer recent payment dates
- Consider adding date range filters to focus on specific time periods
- You may want to add additional aggregate functions (COUNT, AVG, etc.) for more detailed analysis
