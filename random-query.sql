-- Active: 1731175016465@@localhost@3306@task_list

INSERT INTO users (name, email, password) VALUES
('Ana López', 'ana.lopez@email.com', 'password123'),
('Juan Pérez', 'juan.perez@email.com', 'qwerty456'),
('María García', 'maria.garcia@email.com', 'abcde789'),
('Carlos Ruiz', 'carlos.ruiz@email.com', 'passcarlos'),
('Lucía Torres', 'lucia.torres@email.com', 'lucia2025');

INSERT INTO tasks (user_id, title, description, completed, due_date) VALUES
(1, 'Comprar víveres', 'Comprar leche, pan y huevos en el supermercado.', 0, '2025-04-05 18:00:00'),
(1, 'Enviar reporte', 'Enviar el reporte mensual al jefe.', 1, '2025-04-20 09:00:00'),
(1, 'Revisar correo', 'Revisar y responder correos pendientes.', 0, '2025-05-01 10:00:00'),
(1, 'Pagar alquiler', 'Realizar el pago del alquiler del mes.', 1, '2025-05-10 12:00:00'),
(1, 'Cita médica', 'Asistir a la cita médica anual.', 0, '2025-06-15 16:00:00'),
(1, 'Actualizar perfil', 'Actualizar información en la plataforma.', 1, '2025-07-02 14:00:00'),

(2, 'Llamar al cliente', 'Contactar al cliente para seguimiento del proyecto.', 1, '2025-04-24 15:30:00'),
(2, 'Actualizar CV', 'Agregar experiencia reciente al currículum.', 1, '2025-05-15 20:00:00'),
(2, 'Proyecto Laravel', 'Empezar el proyecto de mastermind con Laravel.', 1, '2025-05-10 20:00:00'),
(2, 'Comprar leche', 'Comprar leche de almendras.', 0, '2025-06-06 20:00:00'),
(2, 'Reunión equipo', 'Reunión semanal con el equipo de desarrollo.', 0, '2025-06-12 11:00:00'),
(2, 'Vacaciones', 'Planificar vacaciones de verano.', 0, '2025-07-20 09:00:00'),

(3, 'Pagar servicios', 'Pagar la factura de electricidad y agua.', 0, '2025-05-28 12:00:00'),
(3, 'Estudiar SQL', 'Repasar conceptos de bases de datos.', 1, '2025-04-18 17:00:00'),
(3, 'Comprar regalo', 'Comprar regalo de cumpleaños para mamá.', 0, '2025-06-03 13:00:00'),
(3, 'Leer libro', 'Terminar de leer el libro pendiente.', 1, '2025-07-10 19:00:00'),
(3, 'Renovar licencia', 'Renovar licencia de conducir.', 0, '2025-07-25 08:00:00'),
(3, 'Hacer ejercicio', 'Ir al gimnasio tres veces por semana.', 1, '2025-05-22 07:00:00'),

(4, 'Enviar factura', 'Enviar factura al cliente.', 0, '2025-04-30 10:00:00'),
(4, 'Actualizar software', 'Actualizar el sistema operativo.', 1, '2025-05-05 18:00:00'),
(4, 'Revisar presupuesto', 'Revisar el presupuesto mensual.', 0, '2025-06-08 09:00:00'),
(4, 'Cita con contador', 'Reunión con el contador para impuestos.', 1, '2025-07-15 16:00:00'),
(4, 'Comprar muebles', 'Comprar muebles para la oficina.', 0, '2025-06-20 15:00:00'),
(4, 'Organizar archivos', 'Organizar documentos digitales.', 1, '2025-07-28 11:00:00'),

(5, 'Reparar bicicleta', 'Llevar la bicicleta al taller.', 0, '2025-04-12 17:00:00'),
(5, 'Visitar abuelos', 'Visitar a los abuelos el fin de semana.', 1, '2025-05-18 10:00:00'),
(5, 'Hacer compras', 'Hacer la compra semanal.', 0, '2025-06-01 13:00:00'),
(5, 'Estudiar inglés', 'Practicar inglés una hora diaria.', 1, '2025-07-05 20:00:00'),
(5, 'Pasear al perro', 'Sacar al perro a pasear todos los días.', 0, '2025-06-25 08:00:00'),
(5, 'Revisar inversiones', 'Revisar el estado de las inversiones.', 1, '2025-07-22 18:00:00');

-- Seleccionar las tareas que no hayan sido completadas y el due date sea antes del mes de junio
-- de 2025 junto al usuario que creo cada tarea.
SELECT
    users.id user_id,
    users.name,
    users.email,
    users.password,
    tasks.id task_id,
    tasks.title,
    tasks.description,
    tasks.completed,
    tasks.due_date
FROM users
JOIN tasks ON tasks.user_id = users.id
WHERE tasks.completed = FALSE
    AND YEAR(tasks.due_date) = 2025
    AND MONTH(tasks.due_date) < 6;
