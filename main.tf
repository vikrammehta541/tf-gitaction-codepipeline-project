terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0"

  backend "s3" {
    bucket         = "vhm-terraform-state-bucket"
    key            = "Projects\tf-gitaction-codepipeline-project/terraform.tfstate"
    dynamodb_table = "vhm-db-terraform-locks"
    region         = "us-east-1"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (change as needed)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

