-- Active: 1731175016465@@localhost@3306@payments

-- Una Transacción en Base de Datos es una secuencia de consultas que, o se ejecutan todas,
-- o no se ejecuta ninguna de ellas

INSERT INTO users (name, email, password)
VALUES
    ( "Pepe", "pepe@pepe.com", "pepe123"),
    ( "Kevin", "kevin@kevin.com", "kevin123");

-- Crear una cuenta para los usuarios
INSERT INTO accounts (user_id, name, description, balance)
VALUES
    (1, "Pepe account", "My total money", 1300),
    (2, "Kevin account", "My money savings", 18000);

-- Consultas para realizar una transferencia desde cuenta de Kevin a Pepe, sin usar Transacciones
INSERT INTO transfers (from_account_id, to_account_id, amount, `date`, status)
VALUES (2, 1, 700, "2025-05-20", "PAYED");

-- Update balances
UPDATE accounts SET balance = balance - 700 WHERE id = 2;
UPDATE accounts SET balance = balance + 700 WHERE id = 1;


-- Consultas para realizar una transferencia usando una Transaccion
-- Si ocurre un error en una consulta que conforma la transaccion, no se ejecuta nada de la transaccion
-- O todo sale bien y se ejecuta la transaccion, o no se ejecuta nada
START TRANSACTION;
    INSERT INTO transfers (from_account_id, to_account_id, amount, `date`, status)
    VALUES (1, 2, 800, "2025-11-20", "PAYED");
    UPDATE accounts SET balance = balance - 800 WHERE id = 1;
    UPDATE accounts SET balance = balance + 800 WHERE id = 2;
COMMIT;


SELECT * FROM transfers;
SELECT * FROM accounts;
