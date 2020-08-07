/*Создайте хранимую функцию hello(), которая будет возвращать приветствие,
 в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна 
 возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать 
 фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — 
 "Доброй ночи".*/
delimiter //
DROP FUNCTION IF EXISTS hello //
CREATE FUNCTION hello() RETURNS char(255) DETERMINISTIC 
BEGIN
    DECLARE currenttime time;
    SELECT CURTIME() INTO currenttime;
    IF (currenttime BETWEEN '06:00:00' AND '12:00:00') THEN
        RETURN 'Доброе утро';
    ELSEIF (currenttime BETWEEN '12:00:00' AND '18:00:00') THEN 
        RETURN 'Добрый день';
    ELSEIF (currenttime BETWEEN '18:00:00' AND '23:59:59') THEN
        RETURN 'Добрый вечер';
    ELSE
        RETURN 'Доброй ночи';
    END IF;
END //
SELECT hello() //