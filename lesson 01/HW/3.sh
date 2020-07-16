#!/usr/bin/env bash
# Создайте дамп базы данных example из предыдущего задания,
# разверните содержимое дампа в новую базу данных sample
sudo mysqldump example > example.sql
sudo mysql < 3.sql
sudo mysql sample < example.sql