-- Active: 1731175016465@@localhost@3306@ecommerce
DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce DEFAULT CHARACTER SET = 'utf8mb4';

USE ecommerce;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE addresses (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    country VARCHAR(255) NOT NULL,
    province VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL,
    postal_code VARCHAR(255) NOT NULL,
    unit VARCHAR(255) NULL,

    FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE stores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE products (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    store_id INT UNSIGNED NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(1024) NOT NULL,
    stock INT UNSIGNED NOT NULL,
    price DECIMAL(8, 2) NOT NULL,  -- 999_999.99
    discount TINYINT UNSIGNED NOT NULL,

    FOREIGN KEY (store_id) REFERENCES stores (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE product_images (
    product_id INT UNSIGNED NOT NULL,
    url VARCHAR(255) NOT NULL UNIQUE,

    FOREIGN KEY (product_id) REFERENCES products (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE product_colors (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id INT UNSIGNED NOT NULL,
    color VARCHAR(255) NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE product_sizes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    product_id INT UNSIGNED NOT NULL,
    size VARCHAR(255) NOT NULL,

    FOREIGN KEY (product_id) REFERENCES products (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE orders (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    address_id INT UNSIGNED NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL, -- 99_999_999.99
    status ENUM("DELIVERED", "SHIPPED", "DECLINED") NOT NULL,
    invoice_number VARCHAR(255) NOT NULL UNIQUE,

    FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (address_id) REFERENCES addresses (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE order_product (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id INT UNSIGNED NOT NULL,
    product_id INT UNSIGNED NOT NULL,
    product_size_id INT UNSIGNED NULL,
    product_color_id INT UNSIGNED NULL,
    quantity INT UNSIGNED NOT NULL,
    price DECIMAL(8, 2) NOT NULL,  -- 999_999.99
    discount TINYINT UNSIGNED NOT NULL,  -- 99_999.99

    FOREIGN KEY (order_id) REFERENCES orders (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (product_id) REFERENCES products (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (product_size_id) REFERENCES product_sizes (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (product_color_id) REFERENCES product_colors (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);
