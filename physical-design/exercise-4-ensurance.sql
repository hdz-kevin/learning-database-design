DROP DATABASE IF EXISTS ensurance;

CREATE DATABASE ensurance DEFAULT CHARACTER SET = 'utf8mb4';

USE ensurance;

CREATE TABLE clients (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    id_document_number VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE insurances (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    client_id INT UNSIGNED NOT NULL,
    percentage_covered TINYINT UNSIGNED NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    annual_cost DECIMAL(8, 2) NOT NULL, -- numero con max 8 digitos de los cuales 2 seran decimales.
    type ENUM('VEHICLE', 'PROPERTY'),

    FOREIGN KEY (client_id) REFERENCES clients (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT ck_percentage_covered_less_than_100 CHECK (percentage_covered <= 100) -- constraint creado manualmente
);

CREATE TABLE vehicles (
    insurance_id INT UNSIGNED PRIMARY KEY,
    plate_number VARCHAR(255) NOT NULL UNIQUE,
    price DECIMAL(8, 2) NOT NULL,

    FOREIGN KEY (insurance_id) REFERENCES insurances (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE properties (
    insurance_id INT UNSIGNED PRIMARY KEY,
    area DECIMAL(6, 2) NOT NULL, -- 9_999.99
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL,
    unit VARCHAR(255) NULL,

    FOREIGN KEY (insurance_id) REFERENCES insurances (id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)
