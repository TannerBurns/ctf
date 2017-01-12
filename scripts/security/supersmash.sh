#!/bin/bash

pathtoserver='/vagrant/servers/smash/.'
pathtoflag='/vagrant/flags/smash/supersmash'

sudo addgroup -gid 999 sauce1
mkdir /ctf/steak249
sudo useradd -m -d /ctf/steak249/home a1steaksauce -g 999 -s /usr/sbin/nologin
mkdir /ctf/steak249/flags
mkdir /ctf/steak249/start

cp -R "$pathtoserver" /ctf/steak249/home/
cp "$pathtoflag" /ctf/steak249/flags/

chown -R nobody:sauce1 /ctf/steak249
chown -R nobody:sauce1 /ctf/steak249/flags
chown -R nobody:sauce1 /ctf/steak249/start
chown -R nobody:sauce1 /ctf/steak249/home

chmod 010 /ctf/steak249
chmod 010 /ctf/steak249/home
chmod 050 /ctf/steak249/home/*
chmod 010 /ctf/steak249/start/
chmod 050 /ctf/steak249/flags/
#chmod 050 /ctf/steak249/start/*
chmod 040 /ctf/steak249/flags/*

chmod 711 /home/trevor
ln -s /ctf/steak249/flags/supersmash /home/trevor/flag
chown -h a1steaksauce:sauce1 /home/trevor/flag

echo "*/1 * * * * cd /ctf/steak249/flags/; sudo -u a1steaksauce -H /ctf/steak249/home/server.py > /var/log/cronlogs/steak249_ctf-servers.log 2>&1" >> /home/vagrant/vagrant_cron
