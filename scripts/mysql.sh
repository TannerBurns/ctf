#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpw"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpw"
apt-get install -y mysql-server-5.6
mysql_secure_installation

# create database and user
mysql -u root -prootpw -e "CREATE DATABASE exploits;"
mysql -u root -prootpw -e "CREATE TABLE users (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, username VARCHAR(20), password VARCHAR(20));" exploits
mysql -u root -prootpw -e "CREATE USER 'user1' IDENTIFIED BY 'user1';"
mysql -u root -prootpw -e "GRANT SELECT ON users TO 'user1'@'localhost';" exploits
mysql -u root -prootpw -e "FLUSH PRIVILEGES;"