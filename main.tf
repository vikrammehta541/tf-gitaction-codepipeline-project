# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 5.0" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (change as needed)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

