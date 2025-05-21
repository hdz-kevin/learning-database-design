-- Active: 1731175016465@@localhost@3306@task_list
USE task_list;

INSERT INTO users (name, email, password)
VALUES
    ("Antonio", "antonio@antonio.com", "antonio123"),
    ("Kevin", "kevin@kevin.com", "kevin123"),
    ("Nate", "nate@nate.com", "nate123");


INSERT INTO tasks (user_id, title, description, due_date)
VALUES
    (1, "Actualizar curso Laravel", "Actualizar curso de Laravel a la version 12", "2025-06-00"),
    (1, "Aprender C#", "Buscar un curso para aprender C#", "2025-07-00"),
    (2, "Completar cat-adoptions", "Terminar el proyecto propuesto en mastermind", "2025-05-30"),
    (2, "Entrenar", "Ir al gym y entrenar pechito", "2025-05-14 18:00:00"),
    (3, "Trabajar en el proximo video", "Pensar en ideas para mi proximo video de youtube", "2025-05-15 09:30:20");


-- Comprobando el funcionamiento de las reglas de integridad referencial (CASCADE, RESTRICT, SET NULL)
-- FK user_id en tabla tasks;

-- ON UPDATE CASCADE  ON DELETE CASCADE:
-- se actualiza la FK al cambiar la PK en users
UPDATE users SET id = 23 WHERE id = 1;

-- se borran las tareas con user_id 3
DELETE FROM users WHERE id = 3;


-- ON UPDATE RESTRICT  ON DELETE RESTRICT:
UPDATE users SET id = 23 WHERE id = 1; -- La BD no permitirá realizar esta operación, ya que hay una FK
                                        -- en tasks con RESTRICT apuntando a user id 1.
DELETE FROM users WHERE id = 1; -- No se puede borrar una fila a la que una FK con RESTRICT en otra tabla
                                -- le está referenciando.


-- ON UPDATE SET NULL  ON DELETE SET NULL:
UPDATE users SET id = 23 WHERE id = 1; -- Las FK's que apunten al user id 1, se les asignará NULL.
DELETE FROM users WHERE id = 1; -- Las FK's que apunten al user id 1, se les asignará NULL.

SELECT * FROM users;
SELECT * FROM tasks;
