# Provisioning an HTTP Server on EC2 with Terraform

This walkthrough provides a step-by-step guide to provisioning an AWS EC2 instance, creating and configuring a security group to allow HTTP traffic, and installing the Apache Web Server to host a simple website using Terraform.

## Prerequisites
Before getting started, ensure that you have Terraform and AWS CLI installed on your local system.

## Step 1: Create a Terraform file
Create a Terraform configuration file (e.g., `simpleWeb.tf`) with the following contents:
```
# Provisioning an HTTP Server on EC2 with Terraform

This walkthrough provides a step-by-step guide to provisioning an AWS EC2 instance, creating and configuring a security group to allow HTTP traffic, and installing the Apache Web Server to host a simple website using Terraform.

## Prerequisites
Before getting started, ensure that you have Terraform and AWS CLI installed on your local system.

## Step 1: Create a Terraform file
Create a Terraform configuration file (e.g., `simpleWeb.tf`) with the following contents:

```hcl
terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "your-region"
  profile = "your-aws-profile"
}

resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Allow HTTP and HTTPS traffic"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "day2_ec2" {
  ami                    = "your-ami"
  instance_type          = "t2.micro"
  user_data              = file("simpleWeb.sh")
  tags = {
    Name = "EC2 Demo"
  }
  vpc_security_group_ids = [aws_security_group.vpc-web.id]
}
```

## Step 2: Create a Bash file
Create a Bash script file (e.g., simpleWeb.sh) with the following contents:
```
#!/bin/bash

# System Updates
yum update -y

# Web Server Installation
yum install httpd -y

# Web Server Configuration
systemctl enable httpd
systemctl start httpd

# Creating Web Content
echo "Welcome to Terraform - APP-1" > /var/www/html/index.html
mkdir -p /var/www/html/app1
echo "<h1>Terraform Demo</h1><p>Application Version: V1</p>" > /var/www/html/app1/index.html

```

## Step 3: Terraform Workflow
+ Initialize Terraform
+ Terraform Validate
+ Terraform Plan
+ Terraform Apply to Create EC2 Instance
+ Destroy EC2 Instance

## Conclusion
By following this walkthrough, you've learned how to provision an AWS EC2 instance, create and set up a Security Group to allow HTTP traffic, and install the Apache Web Server to host a simple website, all through Terraform automation.
