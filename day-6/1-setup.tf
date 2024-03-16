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
  profile = "default"
  region = "ap-south-1"
}