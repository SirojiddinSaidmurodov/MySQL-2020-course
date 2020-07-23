/* Выведите список товаров products и разделов catalogs, который соответствует товару. */
SELECT products.name product,
    catalogs.name 'catalog'
from products
    JOIN catalogs
where catalog_id = catalogs.id;