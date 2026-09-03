CREATE DATABASE retail_project;
USE retail_project;
SELECT*FROM sales_data;
SELECT COUNT(*) FROM sales_data;
SELECT * FROM sales_data WHERE quantity_sold IS NULL;
SELECT SUM(total_sales) AS total_revenue FROM sales_data;
SELECT AVG(total_sales) AS average_sales FROM sales_data;
SELECT product_id, SUM(quantity_sold) AS total_quantity FROM sales_data
GROUP BY product_id ORDER BY total_quantity DESC LIMIT 10;
SELECT product_id, SUM(quantity_sold) AS total_quantity FROM sales_data
GROUP BY product_id ORDER BY total_quantity ASC LIMIT 10;
SELECT store_nbr, SUM(total_sales) AS sales FROM sales_data GROUP BY  store_nbr;
SELECT Transaction_date,SUM(total_sales) FROM sales_data GROUP BY Transaction_date;
SELECT product_id, SUM(quantity_sold) AS demand FROM sales_data GROUP BY product_id ORDER BY demand DESC LIMIT 5;
SELECT * FROM sales_data 
WHERE Stock_level < 'Reorder level';
SELECT product_id, stock_level,'Reorder level' FROM sales_data WHERE Reorder_status = 'Reorder Needed';
SELECT product_id, SUM(profit) AS total_profit FROM sales_data GROUP BY product_id ORDER BY total_profit DESC;
SELECT AVG(discount_percent) AS avg_discount FROM sales_data;
SELECT product_id, discount_percent FROM sales_data ORDER BY discount_percent DESC LIMIT 10;
SELECT MONTH(transaction_date) AS month_no, SUM(total_sales) AS monthly_sales
FROM sales_data GROUP BY MONTH(transaction_date);
SELECT product_id, remaining_stock FROM sales_data ORDER BY remaining_stock asc;
SELECT onpromotion, SUM(total_sales) FROM sales_data GROUP BY onpromotion;
CREATE VIEW sales_summary AS SELECT product_id, SUM(total_sales)AS sales FROM sales_data GROUP BY product_id;
SELECT * FROM sales_summary;
SELECT product_id, Transaction_date,AVG(quantity_sold) AS avg_demand
FROM sales_data GROUP BY Transaction_date;




SELECT * FROM items;
SELECT COUNT(*) FROM items;
SELECT family, COUNT(*) AS total_products FROM items GROUP BY family;
SELECT * FROM items WHERE perishable = 1;
SELECT * FROM items WHERE perishable = 0;
SELECT class, COUNT(*) AS total_items FROM items GROUP BY class;
SELECT s.product_id, i.family, SUM(s.quantity_sold) AS total_sales FROM sales_data s JOIN items i
ON  s. product_id = i.item_nbr GROUP BY i.family;