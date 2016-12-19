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
apt-get -y install python-pip
#fix for mac
apt-get -y install ruby2.0
apt-get -y install ruby2.0-dev
#run 32bit on 64bit
apt-get -y install libc6-i386

npm install -g coffee-script
npm install -g react-tools
npm install -g jsxhint

pip install RandomWords
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

#set up devploy in rc.local
echo '#!/bin/bash' > /etc/rc.local
echo '/vagrant/scripts/devploy' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local

#for security
mkdir /ctf
touch /vagrant/scripts/security/results.txt
/vagrant/scripts/security/security.py
mkdir /home/trevor/
/vagrant/scripts/security/supersmash.sh

#deploy site
/home/vagrant/scripts/devploy

#load problems
cd /home/vagrant/api;python3 api_manager.py problems load /vagrant/problems/ graders/ ../problem_static/
cd /home/vagrant/api;python3 api_manager.py autogen build 100

#set up crontab
crontab /vagrant/scripts/security/vagrant_cron

#deploy site
/home/vagrant/scripts/devploy

