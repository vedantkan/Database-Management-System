USE vbk10;

DROP TABLE IF EXISTS customers;
CREATE TABLE IF NOT EXISTS customers(
	customer_number INT(11) NOT NULL PRIMARY KEY,
    customer_last_name VARCHAR(50) NOT NULL,
    customer_first_name VARCHAR(50) NOT NULL,
    phone VARCHAR(50) NOT NULL,
    address_line_1 VARCHAR(50) NOT NULL,
    address_line_2 VARCHAR(50) NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NULL,
    zip VARCHAR(15) NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS employees;
CREATE TABLE IF NOT EXISTS employees(
	employee_number INT(11) NOT NULL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    extension VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    job_title VARCHAR(50) NOT NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products(
	product_code VARCHAR(15) NOT NULL PRIMARY KEY,
    product_name VARCHAR(70) NOT NULL,
    product_vendor VARCHAR(150) NOT NULL,
    product_description TEXT NOT NULL,
    quantity_in_stock SMALLINT(6) NOT NULL,
    buy_price DOUBLE NOT NULL,
    msrp DOUBLE NOT NULL
)Engine=InnoDB;

DROP TABLE IF EXISTS orders;
CREATE TABLE IF NOT EXISTS orders(
	order_number INT(11) NOT NULL PRIMARY KEY,
    order_date DATE NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE NULL,
    status VARCHAR(15) NOT NULL,
    fk_customer_number INT(11) NOT NULL,
    fk_employee_number INT(11) NOT NULL,
    FOREIGN KEY(fk_customer_number) REFERENCES customers(customer_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(fk_employee_number) REFERENCES employees(employee_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

DROP TABLE IF EXISTS orderdetails;
CREATE TABLE IF NOT EXISTS orderdetails(
	fk_order_number INT(11) NOT NULL,
    fk_product_code VARCHAR(15) NOT NULL,
    quantity_ordered INT(11) NOT NULL,
    price_each DOUBLE NOT NULL,
    PRIMARY KEY(fk_order_number, fk_product_code),
    FOREIGN KEY(fk_order_number) REFERENCES orders(order_number)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(fk_product_code) REFERENCES products(product_code)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)Engine=InnoDB;

INSERT INTO customers
(customer_number, customer_last_name, customer_first_name, phone, address_line_1, address_line_2, city, state, zip)
VALUES
(11111, 'REACHER', 'JACK', '999-888-7777', '123 MAIN STREET', NULL, 'PITTSBURGH', 'PA', '15213'), 
(22222, 'BOND', 'JAMES', '999-888-0007', 'WELLINGTON SQUARE', '30', 'CHELSEA', 'LONDON', 'SW16-1HS'), 
(33333, 'HOLMES', 'SHERLOCK', '999-555-7777', 'BAKER STREET', '221-B', 'LONDON CITY', 'LONDON', 'NW1-6XE'); 

INSERT INTO employees
(employee_number, last_name, first_name, extension, email, job_title)
VALUES
(05322, 'MILLS', 'BRYAN', '4635', 'taken@pitt.edu', 'SECURITY'),
(05327, 'TIWARI', 'SRIKANT', '4700', 'familyman@pitt.edu', 'IT MANGER'),
(05375, 'BOURNE', 'JASON', '4500', 'bourneidentity@pitt.edu', 'SALES MANAGER');

INSERT INTO products
(product_code, product_name, product_vendor, product_description, quantity_in_stock, buy_price, msrp)
VALUES
('AAA111', 'BOTTLE', 'MILTON', 'KEEPS HOT LIQUID HOT AND COLD LIQUID COLD FOR 24 HOURS', '100', 4.15, 4.99),
('BBB255', 'AIR-FRYER', 'BELLA', 'Cook up healthy meals with this Bella Pro Series 8-qt. Digital Air Fryer. The built-in touchscreen makes selecting settings fast and intuitive, while the large capacity lets you cook large meals at once. This 8-qt. air fryer features stainless steel construction for added durability, and the pan and tray are dishwasher-safe for simple cleaning.', '30', 75.99, 119.99),
('CCC475', 'COFFEE-MACHINE', 'KEURIG', 'Start your day on a refreshing note with the Keurig K-Elite brewer. The brewer has a modern design that comes with programmable functions to give you the ultimate coffee experience. Its premium finish will surely be a classy addition to your kitchen. You can make yourself a strong brew when you are looking for something bold or just use the Iced button and relax with a refreshing cup of iced coffee. The coffee maker features 5 brew sizes. So you can go ahead and choose from a list of options from coffee, hot cocoa, tea, and iced beverage. Pick your favorite from hundreds of delicious K-Cup pods or if you prefer your ground coffee, you can use the opt for the Universal My K-Cup Reusable Coffee Filter (sold separately). This single serve coffee maker comes with programmable functions like temperature control and auto on, and if you are feeling a little snacky, you can even get hot water on demand to make yourself instant noodles, soups, and oatmeal. You can brew 8 cups between refills thanks to its 75oz removable water reservoir.', '50', 99.99, 139.99);

INSERT INTO orders
(order_number, order_date, required_date, shipped_date, status, fk_customer_number, fk_employee_number)
VALUES
(900045, '2022-01-03', '2022-01-05', NULL, 'PROCESSING', 11111, 05327),
(913200, '2022-01-07', '2022-01-12', '2022-01-11', 'SHIPPED', 22222, 05327),
(956550, '2022-01-10', '2022-01-11', '2022-01-10', 'DELIVERED', 11111, 05375);

INSERT INTO orderdetails
(fk_order_number, fk_product_code, quantity_ordered, price_each)
VALUES
(900045, 'AAA111', 5, 4.99),
(956550, 'CCC475', 1, 139.99),
(956550, 'BBB255', 1, 119.99),
(900045, 'CCC475', 1, 139.99),
(913200, 'AAA111', 2, 4.99),
(913200, 'CCC475', 1, 139.99);

SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderdetails;
