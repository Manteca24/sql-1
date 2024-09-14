INSERT INTO challenge1.usuarios_lenguajes (nombre, apellido, email, edad, lenguaje) VALUES
('Matilda', 'Morán', 'matilda.moran@gmail.com', 25, 'JavaScript'), 
('Ángela', 'Navarta', 'angela.navarta@gmail.com', 27, 'JavaScript'),
('Laura', 'Luque', 'laura.luque@gmail.com', 24, 'JavaScript'),
('Pablo', 'Padilla', 'pablo.padilla@gmail.com', 21, 'CSS'),
('Naira', 'Peña', 'naira.peña@gmail.com', 21, 'Java'),
('Lucía', 'Peña', 'lucia.peña@gmail.com', 25, 'JavaScript');
SELECT * FROM challenge1.usuarios_lenguajes;

-- Ejercicio 1: Seleccionar todos los usuarios y sus lenguajes asociados.
-- Tu respuesta aquí
SELECT nombre, apellido, lenguaje FROM challenge1.usuarios_lenguajes; 

-- Ejercicio 2: Contar cuántos usuarios hay en total.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes;

-- Ejercicio 3: Seleccionar los usuarios mayores de 30 años.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE edad > 30;

-- Ejercicio 4: Contar cuántos usuarios saben JavaScript.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'JavaScript';

-- Ejercicio 5: Seleccionar los usuarios que tienen 28 años. 
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE edad = 28;

-- Ejercicio 6: Encontrar el usuario con el email 'juan.gomez@example.com'.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE email LIKE 'juan.gomez@example.com';

-- Ejercicio 7: Seleccionar los usuarios que saben Java y tienen menos de 25 años.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'Java' AND edad <25;

-- Ejercicio 8: Contar cuántos usuarios con edades diferentes saben el lenguaje 'Java'.
-- Tu respuesta aquí
SELECT edad, COUNT(DISTINCT id_usuario) AS cantidad_usuarios FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'Java' GROUP BY edad;

-- Ejercicio 9: Seleccionar los usuarios que no saben ningún lenguaje.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NULL;

-- Ejercicio 10: Encontrar el nombre y edad del usuario más joven.
-- Tu respuesta aquí Opción 1
SELECT nombre, edad FROM challenge1.usuarios_lenguajes ORDER BY edad ASC LIMIT 1;
-- Tu respuesta aquí Opción 2
SELECT nombre, edad FROM challenge1.usuarios_lenguajes WHERE edad = (SELECT MIN(edad) FROM challenge1.usuarios_lenguajes);

-- Ejercicio 11: Seleccionar los usuarios y sus edades ordenados por edad de forma descendente.
-- Tu respuesta aquí
SELECT nombre, apellido, edad FROM challenge1.usuarios_lenguajes ORDER BY edad DESC;

-- Ejercicio 12: Contar cuántos usuarios tienen más de 28 años.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE edad>28;

-- Ejercicio 13: Seleccionar los usuarios cuyo apellido contiene la letra 'a'.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE apellido LIKE '%a%';

-- Ejercicio 14: Encontrar el lenguaje más popular entre los usuarios menores de 30 años.
-- Tu respuesta aquí
SELECT lenguaje, COUNT(lenguaje) AS lenguajePopular FROM challenge1.usuarios_lenguajes WHERE edad<30 GROUP BY lenguaje ORDER BY lenguajePopular DESC LIMIT 1; 

-- Ejercicio 15: Seleccionar el usuario  mayor de 25 y que sepa el lenguaje 'TypeScript'.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE edad>25 AND lenguaje LIKE 'TypeScript';

-- Ejercicio 16: Contar cuántos usuarios tienen un lenguaje asociado llamado 'Python'.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'Python';

-- Ejercicio 17: Seleccionar los usuarios y sus lenguajes asociados, si tienen alguno, ordenados por nombre de usuario.
-- Tu respuesta aquí
SELECT nombre, apellido, lenguaje FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL ORDER BY nombre;

-- Ejercicio 18: Encontrar los usuario con el email que contiene la palabra 'example'.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE email LIKE '%example%';

-- Ejercicio 19: Seleccionar los usuarios que saben al menos un lenguaje y tienen una edad entre 25 y 35 años.
-- Tu respuesta aquí OPCIÓN 1:
SELECT * FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL AND edad >=25 AND edad <=35;
-- Tu respuesta aquí OPCIÓN 2: 
SELECT * FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL AND edad BETWEEN 25 AND 35;

-- Ejercicio 20: Contar cuántos usuarios tienen un lenguaje asociado llamado 'CSS' y tienen menos de 30 años.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'CSS' AND edad <30;

-- Ejercicio 21: Seleccionar los usuarios que tienen al menos un lenguaje asociado y mostrar la cantidad de lenguajes que tienen.
-- Tu respuesta aquí
SELECT nombre, apellido, COUNT(lenguaje) AS lenguajesTotales FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL GROUP BY 
nombre, apellido;


-- Ejercicio 22: Encontrar el lenguaje con más caracteres.
-- Tu respuesta aquí
SELECT lenguaje FROM challenge1.usuarios_lenguajes ORDER BY LENGTH(lenguaje) DESC LIMIT 1;

-- Ejercicio 23: Seleccionar los usuarios y mostrar la concatenación de su nombre y apellido.
-- Tu respuesta aquí
SELECT CONCAT(nombre, ' ', apellido) AS nombre_completo FROM challenge1.usuarios_lenguajes;

-- Ejercicio 24: Contar cuántos lenguajes diferentes conocen los usuarios mayores de 25 años. 
-- Tu respuesta aquí
SELECT COUNT(DISTINCT lenguaje) AS lenguajesTotales FROM challenge1.usuarios_lenguajes WHERE edad > 25; 

-- Ejercicio 25: Seleccionar los usuarios que tienen exactamente la misma edad.
-- Tu respuesta aquí
SELECT edad, GROUP_CONCAT(CONCAT(nombre, ' ', apellido) ORDER BY nombre SEPARATOR ', ') AS usuarios
FROM challenge1.usuarios_lenguajes GROUP BY edad HAVING COUNT(id_usuario) > 1;

-- Ejercicio 26: Encontrar el usuario con el lenguaje con mayor número de carácteres y que tenga una edad menor de 30 años. 
-- Tu respuesta aquí (igual que el de lenguaje con mayor número de caracteres pero con * y la condición de edad)
SELECT * FROM challenge1.usuarios_lenguajes WHERE edad <30 ORDER BY LENGTH(lenguaje) DESC LIMIT 1 ;

-- Ejercicio 27: Seleccionar los usuarios que tienen al menos un lenguaje asociado y mostrar sus emails.
-- Tu respuesta aquí
SELECT email FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL;

-- Ejercicio 28: Contar cuántos usuarios tienen un apellido que comienza con la letra 'G'.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE apellido LIKE 'G%';

-- Ejercicio 29: Seleccionar los usuarios que tienen lenguajes que empiecen por 'J' y mostrar solo el que tiene menos caracteres. 
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'J%' ORDER BY LENGTH(lenguaje) ASC limit 1; 

-- Ejercicio 30: Encontrar el usuario con edad mayor a 30 y que sabe el lenguaje con menos caracteres.
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE edad >30 ORDER BY LENGTH(lenguaje) ASC LIMIT 1 ;

-- Ejercicio 31: Seleccionar los usuarios que saben al menos un lenguaje y ordenarlos por nombre de lenguaje. 
-- Tu respuesta aquí
SELECT * FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL ORDER BY lenguaje;

-- Ejercicio 32: Contar cuántos usuarios tienen una edad entre 20 y 25 años y saben al menos un lenguaje. 
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE edad BETWEEN 20 AND 25 AND lenguaje IS NOT NULL;

-- Ejercicio 33: Seleccionar los usuarios que no tienen un lenguaje asociado llamado 'SQL'.
-- Tu respuesta aquí (nota: primero lo hice  lenguaje !='SQL', pero problemas si el usuario tiene sql y más lenguajes)
SELECT * FROM challenge1.usuarios_lenguajes WHERE id_usuario NOT IN ( SELECT DISTINCT id_usuario FROM challenge1.usuarios_lenguajes
WHERE lenguaje = 'SQL');

-- Ejercicio 34: Encontrar el lenguaje con más caracteres entre los usuarios que tienen al menos 30 años.
-- Tu respuesta aquí
SELECT lenguaje FROM challenge1.usuarios_lenguajes WHERE edad >=30 ORDER BY LENGTH(lenguaje) DESC LIMIT 1;

-- Ejercicio 35: Seleccionar los usuarios y mostrar la diferencia entre su edad y la edad promedio de todos los usuarios
-- Tu respuesta aquí (si quiero añadir una columna con la edad_media añado al select , (SELECT AVG(edad) FROM challenge1.usuarios_lenguajes) AS edad_media,
SELECT id_usuario, nombre, apellido, edad, ABS(edad - (SELECT AVG(edad) FROM challenge1.usuarios_lenguajes)) AS diferencia
FROM challenge1.usuarios_lenguajes; -- ABS es valor absoluto

-- Ejercicio 36: Contar cuántos usuarios tienen un lenguaje asociado que contiene la palabra 'Script'.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE '%Script';

-- Ejercicio 37: Seleccionar los usuarios que tienen al menos un lenguaje asociado y mostrar la longitud de su nombre. 
-- Tu respuesta aquí
SELECT *, (SELECT length(nombre)) AS longitud_nombre FROM challenge1.usuarios_lenguajes WHERE lenguaje IS NOT NULL;

-- Ejercicio 38: Encontrar el lenguaje del usuario creado más tarde. 
-- Tu respuesta aquí
SELECT lenguaje FROM challenge1.usuarios_lenguajes WHERE id_usuario = (SELECT MAX(id_usuario) FROM challenge1.usuarios_lenguajes);

-- Ejercicio 39: Seleccionar los usuarios y mostrar la suma de sus edades. 
-- Tu respuesta aquí
SELECT SUM(edad) AS suma_edades FROM challenge1.usuarios_lenguajes;

-- Ejercicio 40: Contar cuántos usuarios tienen un lenguaje asociado que comienza con la letra 'P' y tienen menos de 28 años.
-- Tu respuesta aquí
SELECT COUNT(*) FROM challenge1.usuarios_lenguajes WHERE lenguaje LIKE 'P%' AND edad <28;
