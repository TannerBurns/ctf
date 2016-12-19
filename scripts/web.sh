# Configure Nginx
cp /vagrant/config/ctf.nginx /etc/nginx/sites-enabled/ctf
rm /etc/nginx/sites-enabled/default
mkdir -p /srv/http/ctf
service nginx restart

# Configure php fpm
#cp /vagrant/config/hosts /etc
echo "Congfiguring php-fpm"
cp /vagrant/config/php.ini /etc/php/7.0/fpm
cp /vagrant/config/site1.conf /etc/php/7.0/fpm/pool.d #set site1 pool
cp /vagrant/config/site2.conf /etc/php/7.0/fpm/pool.d #set site2 pool
cp /vagrant/config/site3.conf /etc/php/7.0/fpm/pool.d #set site3 pool

#creates user
groupadd site1
useradd -g site1 site1
groupadd site2
useradd -g site2 site2
groupadd site3
useradd -g site3 site3
groupadd site4
useradd -g site4 site4

service php7.0-fpm restart
cp /vagrant/config/10-opcache.ini /etc/php/7.0/fpm/conf.d #disable default php caching
service php7.0-fpm restart

#Add to sites-available
echo "Adding sites-available"
cp /vagrant/config/site1 /etc/nginx/sites-available
cp /vagrant/config/site2 /etc/nginx/sites-available
cp /vagrant/config/site3 /etc/nginx/sites-available
chown -R nobody:site1 /etc/nginx/sites-available/site1
chown -R nobody:site2 /etc/nginx/sites-available/site2
chown -R nobody:site3 /etc/nginx/sites-available/site3

#Link to sites-enabled
echo "Adding sites-enabled"
ln -s /etc/nginx/sites-available/site1 /etc/nginx/sites-enabled/site1
ln -s /etc/nginx/sites-available/site2 /etc/nginx/sites-enabled/site2
ln -s /etc/nginx/sites-available/site3 /etc/nginx/sites-enabled/site3
chown -R nobody:site1 /etc/nginx/sites-enabled/site1
chown -R nobody:site2 /etc/nginx/sites-enabled/site2
chown -R nobody:site3 /etc/nginx/sites-enabled/site3


echo "Setting nginx config"
mkdir /usr/share/nginx/sites
mkdir /usr/share/nginx/sites/site1
mkdir /usr/share/nginx/sites/site2
mkdir /usr/share/nginx/sites/site3

service nginx restart

echo "Adding sites"
cp -r /vagrant/web/php/PHPoverwrite /usr/share/nginx/html/
cp -r /vagrant/web/php/PHPoverwrite /usr/share/nginx/sites/site1/
chown -R nobody:site1 /usr/share/nginx/sites/site1
chmod 011 /usr/share/nginx/sites/site1
chmod 011 /usr/share/nginx/sites/site1/*
chmod 044 /usr/share/nginx/sites/site1/PHPoverwrite/*

cp -r /vagrant/web/php/PHPexecute /usr/share/nginx/html/
cp -r /vagrant/web/php/PHPexecute /usr/share/nginx/sites/site2/
chown -R nobody:site2 /usr/share/nginx/sites/site2/
chmod 011 /usr/share/nginx/sites/site2
chmod 011 /usr/share/nginx/sites/site2/*
chmod 044 /usr/share/nginx/sites/site2/PHPexecute/*
chmod 011 /usr/share/nginx/sites/site2/PHPexecute/assets
chmod 011 /usr/share/nginx/sites/site2/PHPexecute/assets/*
chmod 044 /usr/share/nginx/sites/site2/PHPexecute/assets/css/*
chmod 044 /usr/share/nginx/sites/site2/PHPexecute/assets/js/*

cp -r /vagrant/web/php/SQLi /usr/share/nginx/html/
cp -r /vagrant/web/php/SQLi /usr/share/nginx/sites/site3/
chown -R nobody:site3 /usr/share/nginx/sites/site2/
chmod 011 /usr/share/nginx/sites/site3
chmod 011 /usr/share/nginx/sites/site3/*
chmod 044 /usr/share/nginx/sites/site3/SQLi/*