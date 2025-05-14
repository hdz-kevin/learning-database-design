-- Active: 1731175016465@@localhost@3306@task_list
DROP DATABASE IF EXISTS task_list;

CREATE DATABASE task_list DEFAULT CHARACTER SET = 'utf8mb4';

USE task_list;

CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
    -- se pueden definir restricciones al final de la definición de la tabla o en cada columna
    -- PRIMARY KEY (id),
    -- UNIQUE (email)
);

CREATE TABLE tasks (
    -- SERIAL = BIGINT UNSIGNED AUTO_INCREMENT, -- BIGINT entero de 64 bits
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(512) NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT 0, -- el BOOLEAN al final se convierte en TINYIN, que es un entero de 1 byte o 8 bits
    due_date DATETIME NOT NULL, -- DATETIME incluye año, mes, dia, hora, minuto y segundo

    FOREIGN KEY (user_id) REFERENCES users (id)
        ON UPDATE CASCADE -- default RESTRICT
        ON DELETE CASCADE -- default RESTRICT
);
