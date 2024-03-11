provider "aws" {}

resource "aws_instance" "ec2" {
   ami = "${var.ami_id}"
   key_name = "${var.key_name}"
   instance_type = "${var.instance_type}"
   user_data = <<userdata
#! /bin/bash
apt update
apt install nginx -y 
systemctl enable --now nginx
rm -rf /var/www/html/*
echo "<h1> HELLO WORLD </h1>" > /var/www/html/index.html
userdata
}
