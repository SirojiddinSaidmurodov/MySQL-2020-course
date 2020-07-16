/*������� users ���� �������� ��������������. 
 * ������ created_at � updated_at ���� ������ ����� VARCHAR � � ��� ������
 *  ����� ���������� �������� � ������� "20.10.2017 8:10". ���������� 
 * ������������� ���� � ���� DATETIME, �������� �������� ����� ��������.*/
ALTER TABLE users CHANGE created_at created_at DATATIME AS (STR_TO_DATE(created_at, '%d.%m.%Y %h:%i'));
ALTER TABLE users CHANGE updated_at updated_at DATATIME AS (STR_TO_DATE(updated_at, '%d.%m.%Y %h:%i'));