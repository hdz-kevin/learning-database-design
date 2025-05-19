-- ¿Cuáles son los seguros con un precio superior a 400$?
SELECT * FROM insurances WHERE annual_cost > 400;


-- ¿Qué seguros cubren el 30% o más?
SELECT * FROM insurances WHERE percentage_covered >= 30;


-- ¿Qué seguros han sido contratados antes del año 2021?
-- SELECT * FROM insurances WHERE start_date < '2021-01-01'; Comparando fechas completas
SELECT * FROM insurances WHERE EXTRACT(YEAR FROM start_date) < 2021; -- Comparando solo el año de la fecha


-- ¿Cuáles son los seguros que han sido contradados entre el año 2019 y 2021?
SELECT * FROM insurances WHERE start_date >= '2019-01-01' AND start_date < '2022-01-01';
SELECT * FROM insurances WHERE EXTRACT(YEAR FROM start_date) >= 2019 AND
EXTRACT(YEAR FROM start_date) <= 2021;
-- Forma mas corta con BETWEEN para rangos
SELECT * FROM insurances WHERE EXTRACT(YEAR FROM start_date) BETWEEN 2019 AND 2021;


-- Queremos saber cuáles son los seguros con un valor superior a 400€ o que hayan sido
-- contratados en el año 2019 para ofrecer un descuento a sus dueños.
SELECT * FROM insurances WHERE annual_cost > 400 OR
(start_date >= '2019-01-01' AND start_date < '2020-01-01');
SELECT * FROM insurances WHERE annual_cost > 400 OR EXTRACT(YEAR FROM start_date) = 2019;
