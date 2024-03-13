# Create VPC module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.3"

  # VPC basic  details
  name = "vpc-dev"
  cidr = "10.10.0.0/16"
  azs = ["ap-south-1a", "ap-south-1b"]
  public_subnets = ["10.10.1.0/16", "10.10.2.0/16"]
  private_subnets = ["10.10.3.0/16", "10.10.4.0/16"]

  # Database Subnets
  create_database_subnet_group = true
  create_elasticache_subnet_route_table = true
  database_subnets = ["10.10.5.0/16", "10.10.6.0/16"]

  # NAt Gateway - Outbound communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  # Subnets tags
  public_subnet_tags = {
    Type = "public-subnets"
  }
  private_subnet_tags = {
    Type = "private-subnets"
  }
  database_subnet_tags = {
    Type = "database-subnets"
  }
  tags = {
    Owner = "Anurag"
    Env = "dev"
  }
  vpc_tags = {
    Type = "vpc-dev"
  }
}

