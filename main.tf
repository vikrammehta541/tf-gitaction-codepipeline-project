
# EC2 Instance Resource
resource "aws_instance" "webserver" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-101"
  }
}

/*
# create a ec2 instance
resource "aws_instance" "beb1" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-102"
  }
}


# create a ec2 instance
resource "aws_instance" "Alb1" {
  ami           = "ami-0742b4e673072066f"  # Amazon Linux 2 (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "EC2-103"
  }
}
*/