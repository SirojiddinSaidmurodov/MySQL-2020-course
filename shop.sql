USE shop;
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs(
	id SERIAL PRIMARY KEY,
	name varchar(255) Comment 'Название раздела'
) COMMENT = "Разделы интернет-магазина";
DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name varchar(255) comment 'Имя покупателя',
	birthday_at DATE comment 'Деь рождения',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP
) comment = 'Покупатели';
-- INSERT INTO USERS (id, NAME, birthday_at)
-- VALUES (1, 'Foo', '1970-01-27');
-- SELECT *
-- FROM USERS;
DROP TABLE IF EXISTS products;
CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name varchar(255) comment 'Название',
	description text comment 'Описание',
	price decimal(11, 2) comment 'Цена',
	catalog_id INT UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP,
	INDEX catalog_id(catalog_id)
) comment = 'Товарные позиции';
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	user_id int UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP,
	KEY user_id(user_id)
) comment = 'Заказы';
DROP TABLE IF EXISTS orders_products;
CREATE TABLE orders_products(
	id SERIAL PRIMARY KEY,
	order_id int UNSIGNED,
	product_id int UNSIGNED,
	total int UNSIGNED DEFAULT 1,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP
) comment = 'Состав заказа';
DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts(
	id SERIAL PRIMARY KEY,
	user_id int UNSIGNED,
	product_id int UNSIGNED,
	discount float UNSIGNED,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP,
	started_at DATETIME,
	finished_at DATETIME,
	KEY user_id(user_id),
	KEY product_id(product_id)
);
DROP TABLE IF EXISTS storehouses;
CREATE TABLE storehouses (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255) COMMENT 'Название',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Склады';
DROP TABLE IF EXISTS storehouse_products;
CREATE TABLE storehouse_products(
	id SERIAL PRIMARY KEY,
	storehouse_id int UNSIGNED,
	value int UNSIGNED comment 'Запас товарной позиции на складе',
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON
UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запас на складе';
/* Внешние и первичные ключи */
ALTER TABLE products CHANGE catalog_id catalog_id BIGINT UNSIGNED DEFAULT NULL;
ALTER TABLE products
ADD FOREIGN KEY (catalog_id) REFERENCES catalogs (id) ON DELETE NO ACTION ON UPDATE NO ACTION;