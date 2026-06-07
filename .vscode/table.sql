CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    phone VARCHAR(15)
);
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);