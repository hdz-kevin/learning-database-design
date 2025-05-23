-- Los indices sirven para que las consultas de datos sean más rápidas de lo que serian normalmente
-- a costa de ocupar más espacio. Además pueden ralentizar las operaciones de escritura
-- (INSERT, UPDATE, DELETE) porque el índice tiene que actualizarse cada vez que se modifica la tabla.

-- Si se indexa una columna, será mucho más rapido hacer consultas contra esa columna que si no se indexa

-- Algunos constraints crean indices automáticamente
-- PRIMARY KEY
-- UNIQUE
-- FOREIGN KEY
