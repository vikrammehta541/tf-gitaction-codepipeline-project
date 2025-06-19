
# EC2 Instance Resource
resource "aws_instance" "web" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}

# create a ec2 instance
resource "aws_instance" "web1" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform-EC2-1"
  }
}
