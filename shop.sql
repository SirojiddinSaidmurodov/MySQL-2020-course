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
/* Adding some sqmple data */
INSERT INTO `catalogs`
VALUES (1, 'Процессоры'),
	(2, 'Материнские платы'),
	(3, 'Видеокарты'),
	(4, 'Жесткие диски'),
	(5, 'Оперативная память');
INSERT INTO `products`
VALUES (
		1,
		'Intel Core i3-8100',
		'Процессор для настольных персональных компьютеров, основанных на платформе Intel.',
		7890.00,
		1,
		NULL,
		NULL
	),
	(
		2,
		'Intel Core i5-7400',
		'Процессор для настольных персональных компьютеров, основанных на платформе Intel.',
		12700.00,
		1,
		NULL,
		NULL
	),
	(
		3,
		'AMD FX-8320E',
		'Процессор для настольных персональных компьютеров, основанных на платформе AMD.',
		4780.00,
		1,
		NULL,
		NULL
	),
	(
		4,
		'AMD FX-8320',
		'Процессор для настольных персональных компьютеров, основанных на платформе AMD.',
		7120.00,
		1,
		NULL,
		NULL
	),
	(
		5,
		'ASUS ROG MAXIMUS X HERO',
		'Материнская плата ASUS ROG MAXIMUS X HERO, Z370, Socket 1151-V2, DDR4, ATX',
		19310.00,
		2,
		NULL,
		NULL
	),
	(
		6,
		'Gigabyte H310M S2H',
		'Материнская плата Gigabyte H310M S2H, H310, Socket 1151-V2, DDR4, mATX',
		4790.00,
		2,
		NULL,
		NULL
	),
	(
		7,
		'MSI B250M GAMING PRO',
		'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX',
		5060.00,
		2,
		NULL,
		NULL
	);
INSERT INTO `users`
VALUES (
		1,
		'Геннадий',
		'1990-10-05',
		NULL,
		NULL
	),
	(
		2,
		'Наталья',
		'1984-11-12',
		NULL,
		NULL
	),
	(
		3,
		'Александр',
		'1985-05-20',
		NULL,
		NULL
	),
	(
		4,
		'Сергей',
		'1988-02-14',
		NULL,
		NULL
	),
	(
		5,
		'Иван',
		'1998-01-12',
		NULL,
		NULL
	),
	(
		6,
		'Мария',
		'1992-08-29',
		NULL,
		NULL
	);