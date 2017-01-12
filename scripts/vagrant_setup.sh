#!/bin/bash

echo "======================== /home/vagrant ========================"
if [ ! -d /home/vagrant ]; then
    mkdir -p /home/vagrant
fi
chown vagrant:vagrant /home/vagrant
chmod 700 /home/vagrant
rm -rf /home/vagrant/*

# Updates
echo "======================== Updates ========================"
add-apt-repository -y ppa:ondrej/php
apt-get -y update
apt-get -y upgrade

# CTF-Platform Dependencies
echo "======================== Packages ========================"
apt-get -y install libgdk-pixbuf2.0-dev
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
update-alternatives --remove-all ruby
update-alternatives --remove-all gem
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby2.0 2
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 1
update-alternatives --install /usr/bin/gem gem /usr/bin/gem2.0 2
update-alternatives --install /usr/bin/gem gem /usr/bin/gem1.9.1 1
gem install iconv
#run 32bit on 64bit
apt-get -y install jekyll
apt-get -y install libc6-i386

# install MySQL and create DB with table
echo "======================== MySQL ========================"
/vagrant/scripts/mysql.sh

#install PHP7.0 and modules
echo "======================== PHP7.0 ========================"
apt-get -y install php7.0-fpm
apt-get -y install php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache  php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext
service php7.0-fpm reload

echo "======================== Coffee ========================"
npm install -g coffee-script
npm install -g react-tools
npm install -g jsxhint

pip install RandomWords
pip3 install -r /vagrant/api/requirements.txt

# Jekyll
#gem install jekyll -v 2.5.3
#fix for mac
gem install jekyll-import

echo "======================== Configure Etc Files========================"
cp -f /vagrant/config/passwd /etc/passwd
cp -f /vagrant/config/group /etc/group
cp -f /vagrant/config/shadow /etc/shadow
cp -f /vagrant/config/profile /etc/profile
echo 'PATH=$PATH:/home/vagrant/scripts' >> /etc/profile
chown root:root /etc/passwd /etc/group /etc/profile
chmod 644 /etc/passwd /etc/group /etc/profile
chown root:shadow /etc/shadow
chmod 640 /etc/shadow

#Configure web
echo "======================== Configure Web Problems ========================"
/vagrant/scripts/web.sh

#for security
echo "======================== Configure Servers and Security ========================"
crontab -r
killall /usr/bin/python
chmod 711 /home
chmod 700 /home/*

rm -f /var/log/cronlogs
mkdir /var/log/cronlogs
cp -f /vagrant/config/vagrant_cron /home/vagrant/vagrant_cron
rm -f /home/vagrant/results.txt
touch /home/vagrant/results.txt
chown root:root /home/vagrant/vagrant_cron /home/vagrant/results.txt /var/log/cronlogs
chmod 600 /home/vagrant/vagrant_cron /home/vagrant/results.txt
chmod 711 /var/log/cronlogs
rm -rf /ctf
mkdir /ctf
chown root:root /ctf
chmod 711 /ctf
/vagrant/scripts/security/security.py
rm -rf /home/trevor
mkdir /home/trevor/
/vagrant/scripts/security/supersmash.sh

echo "======================== Deploy Site ========================"
#set up devploy in rc.local
rm -f /home/vagrant/devploy /home/vagrant/genprob
cp -f /vagrant/scripts/devploy /home/vagrant/devploy
cp -f /vagrant/scripts/genprob /home/vagrant/genprob
chown root:root /home/vagrant/devploy /home/vagrant/genprob
chmod 700 /home/vagrant/devploy /home/vagrant/genprob
# must copy all files from /vagrant to /home/vagrant
cp -R /vagrant/web /home/vagrant
cp -R /vagrant/api /home/vagrant
cp -R /vagrant/problems /home/vagrant
echo '#!/bin/bash' > /etc/rc.local
echo '/home/vagrant/devploy' >> /etc/rc.local
echo 'exit 0' >> /etc/rc.local
#deploy site
/home/vagrant/genprob

echo "======================== Configure Cron ========================"
#set up crontab
crontab /home/vagrant/vagrant_cron

echo "======================== All Done ! ========================"
apt-get clean
rm -f /root/.bash_history /root/.history
