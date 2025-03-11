## Restaurant Orders

In this project I used a database to analyze customer behaviour for a restaurant.

## Getting Started

This repository contains SQL files that can be used to recreate a database:
- Use [db.sql](https://github.com/MagdalenaMW/MySQL-Project_Restaurant-Orders-/blob/main/create_restaurant_db.sql) to create all tables,

## Tasks
EXPLORE THE ITEMS

1) Find the number of items on the menu.
``` sql
SELECT COUNT(menu_item_id)
FROM menu_items;
```
**Conclusions**:

2) What are the least and most expensive items on the menu?
```sql
SELECT * 
FROM menu_items
ORDER BY price;
```
```sql
SELECT * 
FROM menu_items
ORDER BY price DESC;
```
**Conclusions**:

3) How many Italian dishes are on the menu?
```sql
SELECT count(category) 
FROM menu_items
WHERE category = 'Italian';
```
**Conclusions**:

4) What are the least and most expensive Italian dishes on the menu?
```sql
SELECT * 
FROM menu_items
WHERE category = 'Italian'
ORDER BY price;
```
```sql
SELECT * 
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;
```
**Conclusions**:

5) How many dishes are in each category?
```sql
SELECT category, COUNT(category) AS 'How many dishes'
FROM menu_items
GROUP BY category;
```
**Conclusions**:

6) What is the average dish price within each category?
```sql
SELECT category, avg(price) AS 'Avg dish price'
FROM menu_items
GROUP BY category;
```
**Conclusions**:

EXPLORE THE ORDERS

1) What is the date range of the table?
```sql
SELECT MIN(order_date), MAX(order_date)
FROM order_details;
```
**Conclusions**:

2) How many orders were made within this date range?
```sql
SELECT COUNT(distinct order_id)
FROM order_details;
```
**Conclusions**:

3) How many items were ordered within this date range?
```sql
SELECT COUNT(order_id)
FROM order_details;
```
**Conclusions**:

4) Witch orders had the most number of items?
```sql
SELECT order_id, COUNT(item_id) AS 'num_items'
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
```
**Conclusions**:

5) How many orders had more than 12 items?
```sql
SELECT COUNT(*)
FROM
(SELECT order_id, COUNT(item_id) AS 'num_items'
FROM order_details
GROUP BY order_id 
HAVING num_items > 12) AS num_orders;
```
**Conclusions**:

ANALYSE CUSTOMER BEHAVIOR
1) Combine the menu_items and order_details into a single table.
``` sql
SELECT *
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;
```
2) What were the least and most ordered items? What categories were they in?
``` sql
SELECT item_name, category, count(order_details_id) AS 'num_purchases'
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC;
```
``` sql
SELECT item_name, category, count(order_details_id) AS 'num_purchases'
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases;
```
**Conclusions**:

3) What were the top 5 orders that spent the most money?
``` sql
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
```
**Conclusions**:

4) View the details of the higest spend order. What insights can you gater from the result?
``` sql
SELECT category, COUNT(category) AS category_total, SUM(price) AS category_spend
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
```
**Conclusions**:

5) View the details of the top 5 highest spend orders. What insights can you gather from the result?
``` sql
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category, order_id;
```
**Conclusions**:


## 🤝 Contributing

Contributions, questions and feature requests are welcome!

Feel free to check the [issues page](https://github.com/MagdalenaMW/MySQL-Project_Restaurant-Orders-/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License
This DB comes from [MAVEN Analytics](https://mavenanalytics.io/data-playground?pageSize=10). 
