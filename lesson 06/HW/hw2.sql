/* Создайте представление, которое выводит название name товарной 
 позиции из таблицы products и соответствующее название каталога name
 из таблицы catalogs. */
USE shop;
CREATE OR REPLACE VIEW products_short AS
SELECT p.name product,
    c.name catalog
FROM products p
    JOIN catalogs c ON p.catalog_id = c.id;
SELECT *
FROM products_short;