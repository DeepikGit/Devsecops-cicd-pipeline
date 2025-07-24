output ami {
  value = aws_instance.main.ami
}
output instance_id {
  value = aws_instance.main.id
}
output instance_type {
  value = aws_instance.main.instance_type
}
output subnet_id {
  value = aws_instance.main.subnet_id
}
output vpc_security_group_ids {
  value = aws_instance.main.vpc_security_group_ids
}
output name {
  value = aws_instance.main.tags["Name"]
}
output user_data {
  value = aws_instance.main.user_data
}
output public_ip {
  value = aws_instance.main.public_ip
}
output private_ip {
  value = aws_instance.main.private_ip
}
output public_dns {
  value = aws_instance.main.public_dns
}
output private_dns {
  value = aws_instance.main.private_dns
}
output instance_tags {
  value = aws_instance.main.tags
}
output instance_key_name {
  value = aws_instance.main.key_name
}
output associate_public_ip_address {
  value = aws_instance.main.associate_public_ip_address
}