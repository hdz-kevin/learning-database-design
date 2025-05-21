-- Los JOIN's permiten recuperar datos de más de una tabla en una misma consulta

-- Esto combinará todos los clientes con todos los seguros
SELECT * FROM clients JOIN insurances;

-- Recuperar todos los seguros combinados con el cliente al que apunta cada uno
SELECT * FROM clients JOIN insurances ON clients.id = client_id;


-- Preguntas
-- 1. Queremos ver los nombres de los clientes, los tipos de seguro que tienen contratados y el coste anual de estos.
SELECT
    clients.name,
    insurances.type,
    insurances.annual_cost
FROM clients JOIN insurances ON clients.id = insurances.client_id;

-- Si hay columnas que no se repiten entre tablas, se puede omitir especificar la tabla de la columna
SELECT
    clients.id AS client_id,
    insurances.id AS insurance_id,
    name,
    type,
    annual_cost
FROM clients JOIN insurances ON clients.id = insurances.client_id;

-- Asignando un alias a las tablas
SELECT
    c.id AS client_id,
    i.id AS insurance_id,
    c.name,
    i.type,
    i.annual_cost
FROM clients c JOIN insurances i ON c.id = i.client_id;


-- 2. Queremos saber el número de matrícula, precio y coste anual del seguro de todos los
-- vehículos que tenemos almacenados.
SELECT 
    vehicles.plate_number,
    vehicles.price,
    insurances.annual_cost
FROM vehicles JOIN insurances ON vehicles.insurance_id = insurances.id
WHERE insurances.type = "VEHICLE"; -- asegurar que se obtendrán solo seguros de vehiculos,
-- no es necesario si los datos son consistentes, que deberían serlo.


-- De cada cliente que tiene propiedades aseguradas queremos saber su nombre, los metros cuadrados de la propiedad,
-- la ciudad donde se ubica dicha propiedad y el coste anual del seguro.

SELECT 
    clients.name,
    properties.area,
    properties.city,
    insurances.annual_cost
FROM clients
JOIN insurances ON clients.id = insurances.client_id
JOIN properties ON properties.insurance_id = insurances.id
WHERE insurances.`type` = "PROPERTY";
