/* В базе данных shop и sample присутствуют одни и те же таблицы
 учебной базы данных. Переместите запись id = 1 из таблицы shop.users
 в таблицу sample.users. Используйте транзакции. */
-- Сначала создадим базу данных sample ...
DROP DATABASE IF EXISTS sample;
CREATE DATABASE sample;
-- и табличку в ней...
CREATE TABLE sample.users(
    id SERIAL PRIMARY KEY,
    name varchar(255) comment 'Имя покупателя',
    birthday_at DATE comment 'Деь рождения',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP
);
-- Собственно сама транзакция
START TRANSACTION;
INSERT INTO sample.users
SELECT *
FROM shop.users
WHERE id = 1;
COMMIT;
SELECT *
FROM sample.users;