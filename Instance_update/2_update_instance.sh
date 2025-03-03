#!/bin/bash

# Creates token to authenticate and retrieve instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`

# Variable to store the instance ID
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)

# Remove Apache and install nginx
yum remove -y httpd
yum install -y nginx

# Update default nginx index.html with instance ID
echo "<br><br><br><h4 align="Center">INSTANCE ID: $INSTANCE_ID</h4>" > /tmp/index.html
cat /usr/share/nginx/html/index.html >> /tmp/index.html
mv /tmp/index.html /usr/share/nginx/html/index.html

# Update the nginx.conf file to turn off the if_modified_since property
sed -i 's/http {/http { \n    if_modified_since off;/g' /etc/nginx/nginx.conf
systemctl restart nginx

# Enable and start nginx
systemctl enable nginx
systemctl start nginx

