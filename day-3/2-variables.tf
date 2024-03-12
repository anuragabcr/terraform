# AWS region
variable "aws_region" {
  description = "region in which the AWS resources to be created"
  type = string
  default = "ap-south-1"
}

# EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t2.micro"
}

# EC2 instance key pair
variable "instance-key" {
  description = "EC2 instance key pair that need to be associated with EC2 instance"
  type = string
  default = "terraform"
}