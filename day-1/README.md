# Creating AWS EC2 Instance using Terraform

This guide walks through the process of creating an AWS EC2 instance using Terraform, an Infrastructure as Code (IaC) tool. Terraform allows you to define and manage infrastructure in a declarative configuration language.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local system.
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured with appropriate access credentials.

## Step 1: Create Terraform File

Create a file with the extension `.tf`, e.g., `instance.tf`, and add the following Terraform configuration:

```hcl
# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "ap-south-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0ba259e664698cbfc" # Amazon Linux in ap-south-1, update as per your region
  instance_type = "t2.micro"
}
```
This configuration specifies the AWS provider, sets the region and credentials profile, and defines an EC2 instance resource.

## Step 2: Initialize Terraform
Open a command prompt or terminal, navigate to the folder containing the Terraform file, and run:

```
terraform init
```
This command prepares Terraform's working directory and downloads any required provider plugins.

## Step 3: Validate Terraform Configuration
Run the following command to validate the Terraform configuration syntax:

```
terraform validate
```
This ensures that your Terraform code adheres to the language rules.

## Step 4: Plan Terraform Changes
Generate an execution plan to preview the changes Terraform will make:

```
terraform plan
```
Review the plan to understand the actions Terraform will take.

## Step 5: Apply Terraform Configuration
Apply the Terraform configuration to create the EC2 instance:

```
terraform apply
```
Confirm the changes, and Terraform will provision the EC2 instance in your AWS account.

## Step 6: Destroy Resources
If needed, you can destroy the provisioned resources using:

```
terraform destroy
```
This command removes the EC2 instance and any associated resources managed by Terraform.

## Conclusion
By following this walkthrough, you've learned how to create an AWS EC2 instance using Terraform. This approach enables you to manage infrastructure as code, ensuring consistency and reproducibility across deployments.
