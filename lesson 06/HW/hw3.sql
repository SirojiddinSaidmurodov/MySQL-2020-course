/*Пусть имеется таблица с календарным полем created_at.
 В ней размещены разряженые календарные записи за август 2018 года
 '2018-08-01', '2018-08-04', '2018-08-16' и 2018-08-17. 
 Составьте запрос, который выводит полный список дат за август,
 выставляя в соседнем поле значение 1, если дата присутствует в
 исходной таблице и 0, если она отсутствует.*/
USE shop;
DROP TABLE IF EXISTS hw3example;
CREATE TEMPORARY TABLE hw3example (created_at date);
INSERT INTO hw3example
VALUES ('2018-08-01'),
    ('2018-08-04'),
    ('2018-08-16'),
    ('2018-08-17');
SET @i := -1;
SELECT date('2018-08-01') + INTERVAL @i := @i + 1 DAY AS augustDay
FROM (
        SELECT p1.id p1id,
            p2.id p2id
        FROM products p1,
            products p2
    ) AS pr
WHERE @i < 30;