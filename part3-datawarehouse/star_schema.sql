-- =====================================
-- DIMENSION TABLES
-- =====================================

-- Date Dimension
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT
);

-- Store Dimension
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(50)
);

-- Product Dimension
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);


-- =====================================
-- FACT TABLE
-- =====================================

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY,
    date_id INT,
    store_id INT,
    product_id INT,
    quantity INT,
    total_amount DECIMAL(10,2),

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- =====================================
-- INSERT CLEANED DATA
-- =====================================

-- Date Data
INSERT INTO dim_date VALUES
(1, '2024-01-01', 1, 2024),
(2, '2024-02-01', 2, 2024),
(3, '2024-03-01', 3, 2024);

-- Store Data
INSERT INTO dim_store VALUES
(1, 'Store A', 'Mumbai'),
(2, 'Store B', 'Delhi'),
(3, 'Store C', 'Bangalore');

-- Product Data
INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'T-Shirt', 'Clothing'),
(3, 'Milk', 'Groceries');

-- Fact Sales (10+ rows)
INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 2, 120000),
(2, 1, 2, 2, 5, 6000),
(3, 2, 1, 3, 10, 500),
(4, 2, 3, 1, 1, 60000),
(5, 3, 2, 3, 8, 400),
(6, 3, 1, 2, 3, 3600),
(7, 1, 3, 1, 2, 120000),
(8, 2, 2, 2, 4, 4800),
(9, 3, 3, 3, 6, 300),
(10, 1, 1, 3, 7, 350);
