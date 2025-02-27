#!/bin/bash
aws ec2 describe-instances --filters "Name=tag:Name,Values=Nginx"
