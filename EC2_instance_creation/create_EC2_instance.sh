#!/bin/bash
aws ec2 run-instances \
--image-id ami-027951e78de46a00e \
--instance-type t2.micro \
--security-group-ids sg-098db6da1c2cffcc2 \
--subnet-id subnet-047e0feffb372eb22 \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Nginx}]' \
--user-data file://user-data.txt

