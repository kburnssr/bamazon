CREATE DATABASE bamazon_db;

/* this is how i connect to a database*/
USE bamazon_db;

CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT, /* NOT NULL means that this column can not be empty, and it is called a constraint */
    item_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    department_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    PRIMARY KEY(id) /* if you don't do line 11, you get an error */
);
INSERT INTO products(item_id,product_name, department_name, price, stock_quantity) VALUES
    (1, "beef jerky", "Food", 20.00, 100),
    (2, "spam", "Food", 5.00, 50),
    (3, "flimsy pins", "automotive", 30.00, 20),
    (4, "muffler bearings", "automotive", 55.00, 10),
    (5, "clif bars", "Food", 12.50, 10),
    (6, "bananas", "Food", 12.00, 30),
    (7, "paper clips", "office", 29.00, 100),
    (8, "reem of paper", "office", 34.00, 100),
    (9, "printer cartridge", "office", 50.00, 100),
    (10, "soap", "household", 10.00, 100);
