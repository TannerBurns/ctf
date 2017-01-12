#!/bin/bash

groupname=$1
dname=$2
uname=$3
pathtoserver=$4
pathtoflagfile=$5
pathofstartfile=$6
gnumber=$7

echo "====== $* ======"

## Add group and set group number ##
echo "Adding Group $groupname"
sudo addgroup --gid "$gnumber" "$groupname"

## Make home directory for new user ##
echo "Making home directory"
mkdir /ctf/"$dname"

## Add new user, add user to group ##
echo "Adding new user $uname"
sudo useradd -m -d /ctf/"$dname"/home "$uname" -g "$gnumber" -s /usr/sbin/nologin

## Make directories ##
echo "Making directories"
mkdir /ctf/"$dname"/flags
mkdir /ctf/"$dname"/start

## move files into the right locations ##
echo "Moving folders"
cp -R "$pathtoserver" /ctf/"$dname"/home/
if [ "$pathtoflagfile" != "none" ]; then cp "$pathtoflagfile" /ctf/"$dname"/flags/ ; fi
if [ "$pathofstartfile" != "none" ]; then cp "$pathofstartfile" /ctf/"$dname"/start/ ; fi

## change ownership ##
echo "Setting ownership"
chown -R nobody:"$groupname" /ctf/"$dname"
chown -R nobody:"$groupname" /ctf/"$dname"/flags
chown -R nobody:"$groupname" /ctf/"$dname"/start
chown -R nobody:"$groupname" /ctf/"$dname"/home

## Set permissions ##
echo "Setting permissions"
chmod 010 /ctf/"$dname"
chmod 010 /ctf/"$dname"/home/
chmod 050 /ctf/"$dname"/home/*
chmod 010 /ctf/"$dname"/start/
chmod 050 /ctf/"$dname"/flags/

if [ "$pathtoflagfile" != "none" ]; then chmod 040 /ctf/"$dname"/flags/* ; fi
if [ "$pathofstartfile" != "none" ]; then chmod 050 /ctf/"$dname"/start/* ; fi

echo "*/1 * * * * cd /ctf/$dname/flags/; sudo -u $uname -H /ctf/$dname/home/server.py > /var/log/cronlogs/"$dname"_ctf-servers.log 2>&1" >> /home/vagrant/vagrant_cron

echo "username:$uname" >> /home/vagrant/results.txt
echo "groupname:$groupname" >> /home/vagrant/results.txt
echo "groupnumber:$gnumber" >> /home/vagrant/results.txt
echo "directory:/ctf/$dname" >> /home/vagrant/results.txt
echo "servername:$pathtoserver" >> /home/vagrant/results.txt
echo "" >> /home/vagrant/results.txt
