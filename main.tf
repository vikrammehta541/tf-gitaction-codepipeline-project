# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"  # Recommended for CI/CD consistency
    }
  }

  backend "s3" {
    bucket         = "vhm-terraform-state-bucket"
    key            = "Projects/tf-gitaction-codepipeline-project/terraform.tfstate"  # ✅ Remote state path
    region         = "us-east-1"
    dynamodb_table = "vhm-db-terraform-locks"
  }

  required_version = ">= 1.0"
}

# AWS Provider Configuration
provider "aws" {
  region = "us-east-1"
  # Do not specify profile when running in GitHub Actions
  # Credentials are taken from env vars: AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY
}

# EC2 Instance Resource
resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

