# Terraform block
terraform {
  required_version = "~> 1.7.4"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

# Provider block
provider "aws" {
  region = "ap-south-1"
  profile = "default"
}

# Resource: Security Group
resource "aws_security_group" "http_sg" {
  name        = "http_security_group"
  description = "Allow HTTP traffic"
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow traffic from anywhere
  }

  tags = {
    Name = "HTTP Security Group"
  }
}

# Resource: EC2 Instance
resource "aws_instance" "day2_ec2" {
  ami = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"
  user_data = file("${path.module}/simpleWeb.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
  security_groups = [aws_security_group.http_sg.name] # Attach the security group to the instance
}