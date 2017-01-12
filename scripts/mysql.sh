#!/bin/bash

export DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< "mysql-server mysql-server/root_password password rootpw"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password rootpw"

apt-get autoremove -y mysql-server-5.6
rm -rf /var/lib/mysql
rm -f /etc/mysql/debian.cnf
cp /vagrant/config/debian.cnf /etc/mysql/debian.cnf
chown root:root /etc/mysql/debian.cnf
chmod 400 /etc/mysql/debian.cnf
apt-get install -y mysql-server-5.6
mysql -u debian-sys-maint -pKkwb9qPUK4Ou7OAY </vagrant/config/mysql-alldbs.sql
service mysql stop
service mysql start
