/* Пусть имеется таблица рейсов flights (id, from, to) и
 таблица городов cities (label, name). Поля from, to и label
 содержат английские названия городов, поле name — русское. 
 Выведите список рейсов flights с русскими названиями городов.
 */
DROP TABLE IF EXISTS flights;
CREATE TABLE flights(id SERIAL, `from` CHAR(255), `to` CHAR(255));
DROP TABLE IF EXISTS cities;
CREATE TABLE cities(label char(255), name CHAR(255));
INSERT INTO flights(id, `from`, `to`)
VALUES (1, 'moscow', 'omsk'),
    (2, 'novgorod', 'kazan'),
    (3, 'irkutsk', 'moscow'),
    (4, 'omsk', 'irkutsk'),
    (5, 'moscow', 'kazan');
INSERT INTO cities
VALUES ('moscow', 'Москва'),
    ('irkutsk', 'Иркутстк'),
    ('novgorod', 'Новгород'),
    ('kazan', 'Казань'),
    ('omsk', 'Омск');
SELECT frst.name,
    scnd.name
FROM (
        SELECT id,
            name
        FROM flights
            JOIN cities ON `from` = label
    ) frst
    JOIN (
        SELECT id,
            name
        FROM flights
            JOIN cities ON `to` = label
    ) scnd USING(id);
DROP TABLE flights;
DROP TABLE cities;