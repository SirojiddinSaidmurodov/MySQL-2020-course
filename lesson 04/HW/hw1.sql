-- ����������� ������� ������� ������������� � ������� users\
SELECT 
AVG(TIMESTAMPDIFF(YEAR, birthday_at,now()))
FROM users;