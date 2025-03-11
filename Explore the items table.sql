-- 1. Find the number of items on the menu.

SELECT COUNT(menu_item_id)
FROM menu_items;

-- 2. What are the least and most expensive items on the menu?
-- least expensive
SELECT * 
FROM menu_items
ORDER BY price;

-- most expensive
SELECT * 
FROM menu_items
ORDER BY price DESC;

-- 3. How many dishes are in each category?

SELECT category, COUNT(category) AS 'How many dishes'
FROM menu_items
GROUP BY category;

-- 4. What are the least and most expensive Italian dishes on the menu?
-- least expensive
SELECT * 
FROM menu_items
WHERE category = 'Italian'
ORDER BY price;

-- most expensive
SELECT * 
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

-- 5. What is the average dish price within each category?

SELECT category, avg(price) AS 'Avg dish price'
FROM menu_items
GROUP BY category;
