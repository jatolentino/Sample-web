#!/bin/bash
yum install -y policycoreutils-python-utils
yum install -y httpd
systemctl enable --now httpd
sed -i '/^Listen 80/a Listen 6052' /etc/httpd/conf/httpd.conf
semanage port -a -t http_port_t -p tcp 6052
systemctl restart httpd
firewall-cmd --add-service=http
firewall-cmd --add-port=6052/tcp
firewall-cmd --reload
echo "Hello World" > /var/www/html/index.html
