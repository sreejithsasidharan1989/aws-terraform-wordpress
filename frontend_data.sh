#!/bin/bash

echo "ClientAliveInterval 60" >> /etc/ssh/sshd_config
echo "LANG=en_US.utf-8" >> /etc/environment
echo "LC_ALL=en_US.utf-8" >> /etc/environment
service sshd restart
yum install httpd -y
amazon-linux-extras install php7.4
systemctl restart httpd.service
wget https://wordpress.org/latest.zip
unzip latest.zip
cat wordpress/wp-config-sample.php | sed 's/database\_name\_here/mydb/g' | sed 's/username\_here/db_user/g' | sed 's/username\_here/db_user/g' | sed 's/password\_here/pass123/g' | sed 's/localhost/db.backtracker.local/g' > wordpress/wp-config.php
cp -r wordpress/* /var/www/html/
chown -R apache:apache /var/www/html
