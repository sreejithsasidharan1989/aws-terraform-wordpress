#!/bin/bash

echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
echo "LANG=en_US.utf-8" >> /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment
service sshd restart 
yum install mariadb-server -y
systemctl restart mariadb.service
systemctl enable mariadb.service
mysql -e "create database mydb"
mysql -e "create user 'db_user'@'%' identified by 'pass123'"
mysql -e "grant all privileges on mydb.* to 'db_user'@'%'"

