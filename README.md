## Restaurant Orders

In this project I used a database to analyze customer behaviour for a restaurant.

## Getting Started

This repository contains [SQL file](https://github.com/MagdalenaMW/MySQL-Project_Restaurant-Orders-/blob/main/create_restaurant_db.sql) that can be used to recreate a database.

## Tasks
EXPLORE THE ITEMS

1) Find the number of items on the menu.
``` sql
SELECT COUNT(menu_item_id)
FROM menu_items;
```
**Conclusions**: On the menu are 32 items.

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
![image](https://github.com/user-attachments/assets/0f42a6db-1128-46d2-9896-c23b019406da)

**Conclusions**: The least expensive is Edamame - 5.00 and the most expensive is Shrimp Scampi - 19.95.

3) How many dishes are in each category?
```sql
SELECT category, COUNT(category) AS 'How many dishes'
FROM menu_items
GROUP BY category;
```
![image](https://github.com/user-attachments/assets/87eea553-0cc0-4d36-808f-0842f9b4adae)

**Conclusions**: In Mexican and Italian categories are 9 dishes, in Asian are 8 dishes and in American are 6 dishes.

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
![image](https://github.com/user-attachments/assets/c741fbe4-e31c-47f3-8ce9-5039bd4a4d1e)

**Conclusions**: The least expensive Italian dishes on the menu is Fettuccine Alfredo and the most expensive is Shrimp Scampi.

5) What is the average dish price within each category?
```sql
SELECT category, avg(price) AS 'Avg dish price'
FROM menu_items
GROUP BY category;
```
![image](https://github.com/user-attachments/assets/462a172e-5e86-46d0-92b7-d7c5fc90c6ed)

**Conclusions**: The average dish price within each category is: Mexican 11.80, Italian 16.750, Asian 13.475, American 10.067.

EXPLORE THE ORDERS

1) What is the date range of the table?
```sql
SELECT MIN(order_date), MAX(order_date)
FROM order_details;
```
**Conclusions**: The range of the table is between 2023-01-01 and 2023-03-31.

2) How many orders were made within this date range?
```sql
SELECT COUNT(distinct order_id)
FROM order_details;
```
**Conclusions**: Within this date were made 5370 orders.

3) How many items were ordered within this date range?
```sql
SELECT COUNT(order_id)
FROM order_details;
```
**Conclusions**: Within this date were ordered 12234 items.

4) Witch orders had the most number of items?
```sql
SELECT order_id, COUNT(item_id) AS 'num_items'
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;
```
![image](https://github.com/user-attachments/assets/73a29796-d4cb-4930-99e0-28217249f3e0)

**Conclusions**: The orders with the highest number of items are: 440, 330, 443, 3473, 4305, 2675, 1957.

5) How many orders had more than 12 items?
```sql
SELECT COUNT(*)
FROM
(SELECT order_id, COUNT(item_id) AS 'num_items'
FROM order_details
GROUP BY order_id 
HAVING num_items > 12) AS num_orders;
```
**Conclusions**: More than 12 items had 20 orders.

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
![image](https://github.com/user-attachments/assets/00607112-2b1d-4c28-ae46-3ff6a9ff9d90)

**Conclusions**: The least ordered item is Chicken Tacos from Mexican category and the most ordered item is Hamburger from American category.

3) What were the top 5 orders that spent the most money?
``` sql
SELECT order_id, SUM(price) AS total_spend
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;
```
![image](https://github.com/user-attachments/assets/2c8060d5-c46f-4596-9b4a-4bd207ff3e57)

**Conclusions**: Top 5 orders that spent the most money were order 440, 2075, 1957, 330, 2675.

4) View the details of the higest spend order. What insights can you gater from the result?
``` sql
SELECT category, COUNT(category) AS category_total, SUM(price) AS category_spend
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category;
```
![image](https://github.com/user-attachments/assets/23eb0ce7-6152-401f-a883-d55649893f68)

**Conclusions**: The highest spending order was in the Italian category. So this is the kind of food people want to eat.

5) View the details of the top 5 highest spend orders. What insights can you gather from the result?
``` sql
SELECT order_id, category, COUNT(item_id) AS num_items
FROM order_details od LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category, order_id;
```
![image](https://github.com/user-attachments/assets/efb88681-6de0-4878-89fa-42b38b416ceb)

**Conclusions**: As we can see from this table, people chose Italian food most often. So this restaurant can increase this category at the expense of the American category.

## 🤝 Contributing

Contributions, questions and feature requests are welcome!

Feel free to check the [issues page](https://github.com/MagdalenaMW/MySQL-Project_Restaurant-Orders-/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License
This DB comes from [MAVEN Analytics](https://mavenanalytics.io/data-playground?pageSize=10). 
