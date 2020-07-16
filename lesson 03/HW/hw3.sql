/*� ������� ��������� ������� storehouses_products � ����
 value ����� ����������� ����� ������ �����: 0, ���� �����
 ���������� � ���� ����, ���� �� ������ ������� ������. ����������
 ������������� ������ ����� �������, ����� ��� ���������� � �������
 ���������� �������� value. ������, ������� ������ ������ ����������
 � �����, ����� ���� �������.*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
value int
);

insert into storehouses_products values 
(0), (2500), (0), (30), (500),(1);

SELECT * FROM storehouses_products 
ORDER BY IF(value=0,pow(2,32), value);