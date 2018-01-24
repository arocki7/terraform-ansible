#!/bin/bash
yum install nginx git -y;
service nginx start;
chkconfig nginx on;
pip install ansible;
