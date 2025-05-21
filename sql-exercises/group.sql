-- Active: 1731175016465@@localhost@3306@ensurance

-- 1. ¿Cuánto dinero hemos ingresado con todos los seguros vendidos hasta la fecha?
SELECT SUM(annual_cost) AS total_billing FROM insurances;


-- 2. ¿Cuánto cuesta el seguro más caro? ¿Y el más barato?
SELECT MIN(annual_cost) AS min, MAX(annual_cost) AS max FROM insurances;


-- 3. ¿Cuál es el seguro más caro? ¿Y el más barato?
SELECT * FROM insurances ORDER BY annual_cost DESC LIMIT 1; -- mas caro

SELECT * FROM insurances ORDER BY annual_cost ASC LIMIT 1; -- mas barato


-- usando subconsultas
SELECT * FROM insurances WHERE annual_cost = (SELECT MAX(annual_cost) FROM insurances);
SELECT * FROM insurances WHERE annual_cost = (SELECT MIN(annual_cost) FROM insurances);


-- 4. ¿Quién ha contratado el seguro más caro?
-- SELECT * FROM clients  WHERE id = (SELECT client_id FROM insurances WHERE annual_cost = (SELECT MAX(annual_cost) FROM insurances));

SELECT
    clients.id,
    clients.name,
    clients.id_document_number
FROM clients
JOIN insurances ON clients.id = insurances.client_id
WHERE insurances.annual_cost = (SELECT MAX(annual_cost) FROM insurances);


-- 5. ¿Cuánto dinero hemos ingresado con los seguros contratados en 2021?
SELECT SUM(annual_cost) FROM insurances WHERE EXTRACT(YEAR FROM start_date) = 2021;


-- 6. ¿Cuál es el precio promedio de los vehículos que hemos asegurado?
SELECT AVG(price) FROM vehicles;


-- 7. ¿Cuántos seguros de propiedad hemos vendido?
SELECT COUNT(*) AS _rows FROM properties;

SELECT COUNT(*) FROM insurances WHERE `type` = 'PROPERTY';


-- 8. ¿Cuánto hemos ingresado en total con cada tipo de seguro?
SELECT SUM(annual_cost) AS total_biling FROM insurances WHERE `type` = 'PROPERTY';

SELECT SUM(annual_cost) AS total_billing FROM insurances WHERE `type` = 'VEHICLE';

-- con joins
SELECT
    SUM(annual_cost) as total_billing
FROM insurances
JOIN properties ON properties.insurance_id = insurances.id;

SELECT
    SUM(annual_cost) as total_billing
FROM insurances
JOIN vehicles ON vehicles.insurance_id = insurances.id;

-- obtener en total de cada tipo en una sola tabla con GROUP BY.
SELECT
    `type`,
    SUM(annual_cost) AS total_billin
FROM insurances GROUP BY `type`;


-- 9. ¿Cuánto nos ha pagado en total cada cliente?
SELECT client_id, SUM(annual_cost) FROM insurances GROUP BY client_id;

-- usando un join para obtener mas datos de los clientes
SELECT
    clients.id,
    clients.name,
    SUM(insurances.annual_cost) AS total_billing
FROM clients
JOIN insurances ON insurances.client_id = clients.id
GROUP BY clients.id;


-- 10. ¿Cuánto nos ha pagado en total cada cliente por cada tipo de seguro?
SELECT
    client_id,
    `type`,
    SUM(annual_cost)
FROM insurances
GROUP BY client_id, `type`;


-- 11. ¿Cuánto seguros de coche y de propiedad tiene cada cliente?
SELECT
    client_id,
    `type`,
    COUNT(*)
FROM insurances
GROUP BY client_id, `type`;
