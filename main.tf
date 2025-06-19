
# EC2 Instance Resource
resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

