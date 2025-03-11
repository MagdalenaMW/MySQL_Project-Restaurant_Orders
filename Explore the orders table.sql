-- 1. What is the date range of the table?

SELECT MIN(order_date), MAX(order_date)
FROM order_details;

-- 2. How many orders were made within this date range?

SELECT COUNT(distinct order_id)
FROM order_details;

-- 3. How many items were ordered within this date range?

SELECT COUNT(order_id)
FROM order_details;

-- 4. Witch orders had the most number of items?

SELECT order_id, COUNT(item_id) AS 'num_items'
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 5. How many orders had more than 12 items?

SELECT COUNT(*)
FROM
(SELECT order_id, COUNT(item_id) AS 'num_items'
FROM order_details
GROUP BY order_id 
HAVING num_items > 12) AS num_orders;
