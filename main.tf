provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Amazon Linux 2 (change as needed)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

