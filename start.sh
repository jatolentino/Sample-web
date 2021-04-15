#!/bin/bash
yum install -y policycoreutils-python-utils
yum install -y httpd
systemctl enable --now httpd
echo "Which port you want to run your server in?"
read $port
sed -i '/^Listen 80/a Listen $port' /etc/httpd/conf/httpd.conf
semanage port -a -t http_port_t -p tcp $port
systemctl restart httpd
firewall-cmd --add-service=http
firewall-cmd --add-port=$port/tcp
firewall-cmd --reload
echo "Hello World" > /var/www/html/index.html
curl http://localhost:6052
