/* Пусть имеется таблица accounts содержащая
 три столбца id, name, password, содержащие 
 первичный ключ, имя пользователя и его пароль. 
 Создайте представление username таблицы accounts,
 предоставляющий доступ к столбца id и name.
 Создайте пользователя user_read, который бы 
 не имел доступа к таблице accounts, однако, 
 мог бы извлекать записи из представления username. */
--  Создадим новую БД с указанной таблицей
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
USE example;
CREATE TABLE accounts(
    id SERIAL PRIMARY KEY,
    name CHAR(255),
    password CHAR(255)
);
-- Теперь создадим представление:
CREATE VIEW username AS
SELECT id,
    name
FROM accounts;
-- Создадим пользователя и дадим ему права:
DROP USER IF EXISTS user_read;
CREATE USER 'user_read' @'localhost';
GRANT SELECT ON example.* TO 'user_read' @'localhost';