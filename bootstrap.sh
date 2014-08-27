#!/usr/bin/env bash

# mysql root:root
echo "mysql-server-5.5 mysql-server/root_password_again password root" | debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password password root" | debconf-set-selections
aptitude update
aptitude install -y mysql-server mysql-client nginx php5-fpm vim php5-curl phpunit php5-mysql php-apc git

# config nginx
cp confs/nginx.conf /etc/nginx/sites-available/default
/etc/init.d/nginx start

cp confs/bashrc.conf /home/vagrant/.bashrc
cp confs/gitignore_global.conf /home/vagrant/.gitignore_global
