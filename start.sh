#!/bin/bash
yum install -y policycoreutils-python-utils
yum install -y httpd
systemctl enable --now httpd
sed -i '/^Listen 80/a Listen 82' /etc/httpd/conf/httpd.conf
