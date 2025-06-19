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
