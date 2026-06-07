SELECT
    c.customer_name,
    c.phone,
    o.order_id,
    o.order_date,
    o.amount
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id;