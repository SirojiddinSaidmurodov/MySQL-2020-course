-- Подсчитайте средний возраст пользователей в таблице users
SELECT AVG(TIMESTAMPDIFF(YEAR, birthday_at, now()))
FROM users;