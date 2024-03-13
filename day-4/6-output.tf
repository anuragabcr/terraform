# Output - FOR loop with list of IPs
output "IPs_list" {
  description = "List of IP address"
  value = [for instance in aws_instance.day4_ec2: instance.public_IP]
}

# Output - MAP of IPs
output "IPs_map" {
  description = "MAP of IP address"
  value = {for instance in aws_instance.aws_instance.day4_ec2: instance.name=> instance.public_IP}
}

# Output - MAP of IPs
output "IPs_map2" {
  description = "MAP of IP address"
  value = {for index, instance in aws_aws_instance.day4_ec2: index=>instance.public_IP}
}

# Output - Splat operator
output "IPs_splat" {
  description = "IP address using splat operator"
  value = aws_instance.day4_ec2[*].public_IP
}