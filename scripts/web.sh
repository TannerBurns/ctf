# Configure Nginx
service nginx stop
service php7.0-fpm stop

echo "Congfiguring nginx and php-fpm"
rm -rf /etc/nginx/sites-available /etc/nginx/sites-enabled
mkdir /etc/nginx/sites-available /etc/nginx/sites-enabled
chmod 755 /etc/nginx/sites-available /etc/nginx/sites-enabled
rm -f /etc/php/7.0/fpm/php.ini 
cp /vagrant/config/php.ini /etc/php/7.0/fpm
cp /vagrant/config/10-opcache.ini /etc/php/7.0/fpm/conf.d #disable default php caching

# main site
echo "Adding main site"
cp /vagrant/config/ctf.nginx /etc/nginx/sites-enabled/ctf
rm -rf /srv/http
mkdir -p /srv/http/ctf
chmod 711 /srv/http /srv/http/ctf

# add site1
echo "Adding site1 PHPoverwrite 10800"
groupadd site1
useradd -g site1 site1
rm -f /etc/php/7.0/fpm/pool.d/site1.conf
cp /vagrant/config/site1.conf /etc/php/7.0/fpm/pool.d #set site1 pool
cp /vagrant/config/site1 /etc/nginx/sites-available
chown -R nobody:site1 /etc/nginx/sites-available/site1
ln -s /etc/nginx/sites-available/site1 /etc/nginx/sites-enabled/site1
chown -R nobody:site1 /etc/nginx/sites-enabled/site1
mkdir /srv/http/site1
cp -r /vagrant/web/php/PHPoverwrite /srv/http/site1/
chown -R nobody:site1 /srv/http/site1
chmod 011 /srv/http/site1
chmod 011 /srv/http/site1/*
chmod 044 /srv/http/site1/PHPoverwrite/*

# add site2
#echo "Adding site2 PHPexecute 10810"
#groupadd site2
#useradd -g site2 site2
#rm -f /etc/php/7.0/fpm/pool.d/site2.conf
#cp /vagrant/config/site2.conf /etc/php/7.0/fpm/pool.d #set site2 pool
#cp /vagrant/config/site2 /etc/nginx/sites-available
#chown -R nobody:site2 /etc/nginx/sites-available/site2
#ln -s /etc/nginx/sites-available/site2 /etc/nginx/sites-enabled/site2
#chown -R nobody:site2 /etc/nginx/sites-enabled/site2
#mkdir /srv/http/site2
#cp -r /vagrant/web/php/PHPexecute /srv/http/site2/
#chown -R nobody:site2 /srv/http/site2/
#chmod 011 /srv/http/site2
#chmod 011 /srv/http/site2/*
#chmod 044 /srv/http/site2/PHPexecute/*
#chmod 011 /srv/http/site2/PHPexecute/assets
#chmod 011 /srv/http/site2/PHPexecute/assets/*
#chmod 044 /srv/http/site2/PHPexecute/assets/css/*
#chmod 044 /srv/http/site2/PHPexecute/assets/js/*


# add site3
echo "Adding site3 SQLi 10811"
groupadd site3
useradd -g site3 site3
rm -f /etc/php/7.0/fpm/pool.d/site3.conf
cp /vagrant/config/site3.conf /etc/php/7.0/fpm/pool.d #set site3 pool
cp /vagrant/config/site3 /etc/nginx/sites-available
chown -R nobody:site3 /etc/nginx/sites-available/site3
ln -s /etc/nginx/sites-available/site3 /etc/nginx/sites-enabled/site3
chown -R nobody:site3 /etc/nginx/sites-enabled/site3
mkdir /srv/http/site3
cp -r /vagrant/web/php/SQLi /srv/http/site3/
chown -R nobody:site3 /srv/http/site3/
chmod 011 /srv/http/site3
chmod 011 /srv/http/site3/*
chmod 044 /srv/http/site3/SQLi/*

# add site4
echo "Adding site4 JSFiddle 10808"
groupadd site4
useradd -g site4 site4
cp /vagrant/config/site4 /etc/nginx/sites-available
chown -R nobody:site4 /etc/nginx/sites-available/site4
ln -s /etc/nginx/sites-available/site4 /etc/nginx/sites-enabled/site4
chown -R nobody:site4 /etc/nginx/sites-enabled/site4
mkdir /srv/http/site4
cp -r /vagrant/web/php/JSFiddle /srv/http/site4/
chown -R nobody:site4 /srv/http/site4/
chmod 011 /srv/http/site4
chmod 011 /srv/http/site4/*
chmod 044 /srv/http/site4/JSFiddle/*

service php7.0-fpm start
service nginx start
