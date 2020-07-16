/*Подсчитайте количество дней рождения, которые приходятся на каждую из дней недели. 
  Следует учесть, что необходимы дни недели текущего года, а не года рождения.*/
USE shop;
SELECT DATE_FORMAT(
        STR_TO_DATE(
            CONCAT(
                DATE_FORMAT(now(), '%Y-'),
                DATE_FORMAT(birthday_at, '%m-%d')
            ),
            '%Y-%m-%d'
        ),
        '%W'
    ) AS DayOfWeek,
    count(*)
FROM users
GROUP BY DayOfWeek;