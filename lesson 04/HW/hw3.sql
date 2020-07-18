-- (по желанию) Подсчитайте произведение чисел в столбце таблицы
DROP TABLE IF EXISTS tab;
CREATE TABLE tab(num int);
INSERT INTO tab VALUES (1),(2),(3),(4),(5);

SELECT EXP(SUM(LN(num))) FROM tab;
DROP TABLE tab;