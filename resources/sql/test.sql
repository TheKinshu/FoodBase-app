-- show all product and ctore name
SELECT *
FROM products p
JOIN stores c
ON p.store_id = c.id;
