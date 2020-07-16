/*¬ таблице складских запасов storehouses_products в поле
 value могут встречатьс€ самые разные цифры: 0, если товар
 закончилс€ и выше нул€, если на складе имеютс€ запасы. Ќеобходимо
 отсортировать записи таким образом, чтобы они выводились в пор€дке
 увеличени€ значени€ value. ќднако, нулевые запасы должны выводитьс€
 в конце, после всех записей.*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
value int
);

insert into storehouses_products values 
(0), (2500), (0), (30), (500),(1);

SELECT * FROM storehouses_products 
ORDER BY IF(value=0,pow(2,32), value);