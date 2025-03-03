#!/bin/bash
#Creates token to retrieve instance metadata
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
          
#Variable for instance ID
INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://169.254.169.254/latest/meta-data/instance-id)

# Install Apache and configure index.html file
yum install -y httpd
echo "<br><br><br><h4 align="Center">INSTANCE ID: $INSTANCE_ID</h4><br><h1 align="Center">Hello, from Apache!</h1>" > /var/www/html/index.html

# Enable and start Apache
systemctl enable httpd
systemctl start httpd
