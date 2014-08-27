#!/usr/bin/env bash

echo 'alias ll="ls -la"' >> /home/vagrant/.bashrc
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
aptitude update
aptitude install -y mysql-server mysql-client nginx php5-fpm vim php5-curl phpunit php5-mysql php-apc git
/etc/init.d/nginx start
