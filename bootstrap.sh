#!/usr/bin/env bash

# mysql root:root
/bin/echo "mysql-server-5.5 mysql-server/root_password_again password root" | /usr/bin/debconf-set-selections
/bin/echo "mysql-server-5.5 mysql-server/root_password password root" | /usr/bin/debconf-set-selections
/usr/bin/aptitude update
/usr/bin/aptitude install -y mysql-server mysql-client nginx php5-fpm vim php5-curl phpunit php5-mysql php-apc git php5-gd drush libapache2-mod-php5 phpmyadmin

# config nginx
/bin/cp confs/nginx.conf /etc/nginx/sites-available/default
/etc/init.d/nginx restart

/bin/cp confs/bashrc.conf /home/vagrant/.bashrc

# config git
/bin/cp confs/gitignore_global.conf /home/vagrant/.gitignore_global
/bin/cp confs/gitconfig.conf /home/vagrant/.gitconfig

# config mysql
/bin/cp confs/mysql.conf /etc/mysql/my.cnf
/etc/init.d/mysql restart

# config apache
/bin/cp confs/apache.conf /etc/apache2/sites-enabled/000-default

# config apache php.ini
/bin/cp confs/apache.php.conf /etc/php5/apache2/php.ini

/etc/init.d/apache2 restart

# git
/bin/cp confs/git-completion.bash /home/vagrant/.git-completion.bash

# timezone
/bin/echo "Europe/Vienna" > /etc/timezone
/usr/sbin/dpkg-reconfigure -f noninteractive tzdata
