/*����� � ������� users ���� created_at � updated_at ��������� ��������������.
 *��������� �� �������� ����� � ��������*/
UPDATE users 
SET updated_at = now(), created_at = now();