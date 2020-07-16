/*ѕусть в таблице users пол€ created_at и updated_at оказались незаполненными.
 *«аполните их текущими датой и временем*/
UPDATE users 
SET updated_at = now(), created_at = now();