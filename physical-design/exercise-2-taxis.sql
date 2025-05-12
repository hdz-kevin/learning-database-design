-- Active: 1731175016465@@localhost@3306@taxis
DROP DATABASE IF EXISTS taxis;

CREATE DATABASE taxis DEFAULT CHARACTER SET = 'utf8mb4';

USE taxis;

CREATE TABLE drivers (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE parkings (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(255) NOT NULL
);

CREATE TABLE vehicles (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    parking_id INT UNSIGNED NULL,
    plate_number VARCHAR(255) UNIQUE NOT NULL,
    brand VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,

    FOREIGN KEY (parking_id) REFERENCES parkings (id) ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE vehicle_images (
    vehicle_id INT UNSIGNED NOT NULL,
    url VARCHAR(255) UNIQUE NOT NULL,

    -- PRIMARY KEY (vehicle_id, url), -- PRIMARY KEY compuesta por vehicle_id y url

    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla Pivote entre drivers y vehicles
CREATE TABLE driver_vehicle (
    driver_id INT UNSIGNED PRIMARY KEY,
    vehicle_id INT UNSIGNED UNIQUE NOT NULL,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    FOREIGN KEY (driver_id) REFERENCES drivers (id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles (id) ON UPDATE CASCADE ON DELETE CASCADE
);
