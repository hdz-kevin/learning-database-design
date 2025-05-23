-- Los Dumps sirven para exportar una base de datos a un archivo, el cual contendrá la estructura de
-- la base de datos y los datos que contiene en ese momento.

-- Comando para hacer un dump de una base de datos redireccionando la salida a un archivo
mysqldump -u root -h 127.0.0.1 -P 3306 -p database_name > dump-file.sql


-- ejecutar el archivo dump en una base de datos
mysql -u root -h 127.0.0.1 -P 3306 -p database_name < dump-file.sql
 

