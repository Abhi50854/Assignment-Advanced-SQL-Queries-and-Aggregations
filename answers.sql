-- Question 1: Total payment amount for each payment date
SELECT 
    paymentDate, 
    SUM(amount) AS total_amount
FROM payments
GROUP BY paymentDate
ORDER BY paymentDate DESC
LIMIT 5;  -- Show only the top 5 latest payment dates

-- Question 2: Average credit limit of each customer
SELECT 
    customerName, 
    country, 
    AVG(creditLimit) AS avg_credit_limit
FROM customers
GROUP BY customerName, country;

SELECT 
    productCode, 
    SUM(quantityOrdered) AS total_quantity, 
    SUM(quantityOrdered * priceEach) AS total_price
FROM orderdetails
GROUP BY productCode;

-- Question 4: Highest payment amount for each check number
SELECT 
    checkNumber, 
    MAX(amount) AS highest_amount
FROM payments
GROUP BY checkNumber;
