#!/bin/bash

# If your instance is named Nginx, then run the following command to get the instance's public IP address : 
aws ec2 describe-instances --filters "Name=tag:Name,Values=Nginx" --query 'Reservations[].Instances[].PublicIpAddress'
