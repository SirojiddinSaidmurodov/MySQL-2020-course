/* В таблице products есть два текстовых поля: name
 с названием товара и description с его описанием.
 Допустимо присутствие обоих полей или одно из них. 
 Ситуация, когда оба поля принимают неопределенное 
 значение NULL неприемлема. Используя триггеры, добейтесь
 того, чтобы одно из этих полей или оба поля были заполнены.
 При попытке присвоить полям NULL-значение необходимо отменить операцию. */
USE shop;
delimiter //
DROP TRIGGER IF EXISTS NAME_DES_NOT_NULL_UPDATE//
CREATE TRIGGER name_des_not_null_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	IF (name IS NULL AND description IS NULL) THEN 
	BEGIN 
		SET NEW.name = COALESCE(NEW.name, OLD.name);
		SET NEW.description = COALESCE (NEW.description, OLD.description);
	END;
	END IF;
END//