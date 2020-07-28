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
DROP TABLE IF EXISTS digits;
CREATE TEMPORARY TABLE digits (symbols INT);
INSERT INTO digits
VALUES (0),
    (1),
    (2),
    (3),
    (4),
    (5),
    (6),
    (7),
    (8),
    (9);
DROP TABLE IF EXISTS tens;
CREATE TEMPORARY TABLE tens (symbols INT);
INSERT INTO tens
VALUES (0),
    (1),
    (2),
    (3);
SELECT created_at,
    created_at IN (
        SELECT *
        FROM hw3example
    ) AS d
FROM (
        SELECT date(CONCAT('2018-08-', tens.symbols, digits.symbols)) created_at
        FROM tens
            JOIN digits
        HAVING created_at BETWEEN date('2018-08-01') AND date('2018-08-01') + INTERVAL 1 MONTH - INTERVAL 1 DAY
        ORDER BY created_at
    ) AS a;