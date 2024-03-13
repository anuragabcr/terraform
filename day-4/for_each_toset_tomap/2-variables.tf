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
variable "instance_key" {
  description = "EC2 instance key pair that need to be associated with EC2 instance"
  type = string
  default = "terraform"
}

# EC2 instance type - list
variable "instance_type_list" {
  description = "EC2 instance type list"
  type = list(string)
  default = [ "t2.micro", "t3.micro" ]
}

# EC2 instance type - map
variable "instance_type_map" {
  description = "EC2 instance type map"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.micro"
    "prod" = "t3.micro"
  }
}