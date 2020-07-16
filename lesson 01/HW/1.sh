#!/usr/bin/env bash
# Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, 
# задав в нем логин и пароль, который указывался при установке.
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install mysql-server
sudo mysql_secure_installation
echo "Введите пароль указанный при установке"
read -r
sudo echo "[client]" >> /etc/mysql/my.cnf
sudo echo "user=root" >> /etc/mysql/my.cnf
sudo echo "password=$REPLY" >> /etc/mysql/my.cnf
