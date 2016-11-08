#!/bin/bash

groupname=$1
dname=$2
uname=$3
pathtoserver=$4
pathtoflagfile=$5
pathofstartfile=$6
gnumber=$7

#echo $1
#echo $2
#echo $3
#echo $4
#echo $5
#echo $6
#echo $7


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
cp "$pathtoflagfile" /ctf/"$dname"/flags/
cp "$pathofstartfile" /ctf/"$dname"/start/

## change ownership ##
echo "Setting ownership"
chown -R nobody:"$groupname" /ctf/"$dname"/flags
chown -R nobody:"$groupname" /ctf/"$dname"/start
chown -R nobody:"$groupname" /ctf/"$dname"/home

## Set permissions ##
echo "Setting permissions"
chmod 010 /ctf/"$dname"/home/
chmod 050 /ctf/"$dname"/home/*
chmod 010 /ctf/"$dname"/start/
chmod 050 /ctf/"$dname"/flags/

chmod 050 /ctf/"$dname"/start/*
chmod 040 /ctf/"$dname"/flags/*


echo "#$pathtoserver" >> /vagrant/scripts/security/launch.sh
echo "sudo sh -c 'cd /ctf/$dname/flags/; sudo -u $uname -H /ctf/$dname/home/server.py'">> /vagrant/scripts/security/launch.sh
echo " " >> /vagrant/scripts/security/launch.sh
chmod 755 /vagrant/scripts/security/launch.sh


echo "username:$uname" >> /vagrant/scripts/security/results.txt
echo "groupname:$groupname" >> /vagrant/scripts/security/results.txt
echo "groupnumber:$gnumber" >> /vagrant/scripts/security/results.txt
echo "directory:/ctf/$dname" >> /vagrant/scripts/security/results.txt
echo "servername:$pathtoserver" >> /vagrant/scripts/security/results.txt
echo "" >> /vagrant/scripts/security/results.txt
