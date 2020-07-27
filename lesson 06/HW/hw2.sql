/* Создайте представление, которое выводит название name товарной 
 позиции из таблицы products и соответствующее название каталога name
 из таблицы catalogs. */
USE shop;
CREATE OR REPLACE VIEW products_short AS
SELECT products.name product,
    catalogs.name catalog
FROM products
    JOIN catalogs ON products.catalog_id = catalogs.id;
SELECT *
FROM products_short;