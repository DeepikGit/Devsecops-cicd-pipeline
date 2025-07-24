output security_group_name {
  value = aws_security_group.main.name
}
output "sg_id" {
  value = aws_security_group.main.id
}