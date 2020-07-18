/*Пусть в таблице users поля created_at и updated_at оказались незаполненными.
 *Заполните их текущими датой и временем*/
UPDATE users 
SET updated_at = now(), created_at = now();