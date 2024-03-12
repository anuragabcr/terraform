# Resource: EC2 Instance
resource "aws_instance" "day2_ec2" {
  ami = "ami-0ba259e664698cbfc"
  instance_type = "t2.micro"
  user_data = file("${path.module}/simpleWeb.sh")
  tags = {
    "Name" = "EC2 Demo"
  }
}