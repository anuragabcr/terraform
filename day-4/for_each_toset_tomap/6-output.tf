# Output - FOR loop with list of IPs
output "IPs_list" {
  description = "List of IP address"
  value = [for instance in aws_instance.day4_ec2: instance.public_ip]
}

# Output - MAP of IPs
output "IPs_map" {
  description = "MAP of IP address"
  value = {for instance in aws_instance.day4_ec2: instance.tags.Name=> instance.public_ip}
}

# Output - MAP of IPs
output "IPs_map2" {
  description = "MAP of IP address"
  value = {for index, instance in aws_instance.day4_ec2: index=>instance.public_ip}
}

# Output - Splat operator
# output "IPs_splat" {
#   description = "IP address using splat operator"
#   value = aws_instance.day4_ec2[*].public_ip
# }