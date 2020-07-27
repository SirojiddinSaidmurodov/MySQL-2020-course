/* Пусть имеется любая таблица с календарным полем created_at.
 Создайте запрос, который удаляет устаревшие записи из таблицы, 
 оставляя только 5 самых свежих записей. */
START TRANSACTION;
-- готовим таблицу для теста
CREATE DATABASE IF NOT EXISTS sample;
DROP TABLE IF EXISTS sample.info;
CREATE TABLE sample.info(days date);
use shop;
SET @i := -1;
INSERT INTO sample.info
SELECT *
FROM (
        SELECT date('2018-08-01') + INTERVAL @i := @i + 1 DAY AS created_at
        FROM (
                SELECT p1.id p1id,
                    p2.id p2id
                FROM products p1,
                    products p2
            ) AS pr
        WHERE @i < 30
    ) s;
COMMIT;
-- сам запрос:
CREATE VIEW lastdata AS
SELECT days
FROM sample.info
ORDER BY days DESC
LIMIT 5;
DELETE FROM sample.info
WHERE days NOT IN (
        SELECT *
        FROM lastdata
    );
SELECT *
FROM sample.info i;