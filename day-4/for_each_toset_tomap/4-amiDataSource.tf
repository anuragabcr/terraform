# Get the latest AMI ID 
data "aws_ami" "amzLinux2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }

  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }

  filter {
    name = "platform-details"
    values = [ "Linux/UNIX" ]
  }
}

# Get Availability zones
data "aws_availability_zones" "zones" {
  filter {
    name = "opt-in-status"
    values = [ "opt-in-not-required" ]
  }
}
