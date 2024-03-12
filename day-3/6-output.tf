# Output from created resources
output "public_IP" {
  description = "EC2 Instance public IP"
  value = aws_instance.day3_ec2.public_ip
}