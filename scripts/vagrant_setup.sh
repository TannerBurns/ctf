#!/bin/bash

# Updates
apt-get -y update
apt-get -y upgrade

# CTF-Platform Dependencies
apt-get -y install python3-pip
apt-get -y install nginx
apt-get -y install mongodb
apt-get -y install gunicorn
apt-get -y install git
apt-get -y install libzmq-dev
apt-get -y install nodejs-legacy
apt-get -y install npm
apt-get -y install libclosure-compiler-java
apt-get -y install ruby-dev
apt-get -y install dos2unix
apt-get -y install tmux
apt-get -y install openjdk-7-jdk
#fix for mac
apt-get -y install ruby2.0
apt-get -y install ruby2.0-dev
#fix for running 32 bit binary on 64 bit system
apt-get install lib32z1
apt-get install lib32ncurses5
apt-get install lib32bz2-1.0

npm install -g coffee-script
npm install -g react-tools
npm install -g jsxhint

pip3 install -r /home/vagrant/api/requirements.txt

# Jekyll
#gem install jekyll -v 2.5.3
#fix for mac
gem2.0 install jekyll-import

# Configure Environment
echo 'PATH=$PATH:/home/vagrant/scripts' >> /etc/profile

# Configure Nginx
cp /vagrant/config/ctf.nginx /etc/nginx/sites-enabled/ctf
rm /etc/nginx/sites-enabled/default
mkdir -p /srv/http/ctf
service nginx restart

#deploy site
/home/vagrant/scripts/devploy

#load problems
cd /home/vagrant/api;python3 api_manager.py problems load /vagrant/problems/ graders/ ../problem_static/
cd /home/vagrant/api;python3 api_manager.py autogen build 100

#deploy site
/home/vagrant/scripts/devploy

