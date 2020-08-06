/* Напишите хранимую функцию для вычисления произвольного числа Фибоначчи.
 Числами Фибоначчи называется последовательность в которой число равно
 сумме двух предыдущих чисел. Вызов функции FIBONACCI(10) 
 должен возвращать число 55.*/
delimiter // 
DROP FUNCTION IF EXISTS FIBONACCI//
CREATE FUNCTION FIBONACCI(n INT)
RETURNS BIGINT DETERMINISTIC
BEGIN
	DECLARE a, b  BIGINT DEFAULT 0;
	SET b = 1;
	-- По Формуле Бине
	RETURN (pow((1+sqrt(5))/2, n ) - pow((1-sqrt(5))/2, n ))/sqrt(5);
END//
SELECT FIBONACCI(10)//

DROP FUNCTION IF EXISTS FIBONACCI//
CREATE FUNCTION FIBONACCI(n INT)
RETURNS BIGINT DETERMINISTIC
BEGIN
	DECLARE a, b, temp  BIGINT DEFAULT 0;
	SET b = 1;
	IF (n=0 OR n = 1) THEN RETURN n;
	END IF;
	SET n = n-1;
	WHILE n > 0 DO
		SET temp = a + b;
		SET a = b;
		SET b = temp;
	END WHILE;
	RETURN temp;
END//
SELECT FIBONACCI(10)//