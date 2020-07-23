DELETE FROM orders;
INSERT INTO orders (user_id)
VALUES (2),
    (5),
    (3),
(2);
SELECT name
from users
where id IN (
        SELECT user_id
        from orders
        group BY user_id
    );