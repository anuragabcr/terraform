# EC2 instance
resource "aws_instance" "day4_ec2" {
  ami = data.aws_ami.amzLinux2.id
  # instance_type = var.instance_type
  # instance_type = var.instance_type_list[0]
  instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/simpleWeb.sh")
  for_each = data.aws_availability_zones.zones.names
  availability_zone = each.key
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  tags = {
    "Name" = "for-each-Demo-${each.value}"
  }
}