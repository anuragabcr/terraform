# EC2 instance
resource "aws_instance" "day3_ec2" {
  ami = data.aws_ami.amzLinux2.id
  instance_type = var.instance_type
  user_data = file("${path.module}/simpleWeb.sh")
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  tags = {
    "Name" = "EC2 Demo"
  }
}