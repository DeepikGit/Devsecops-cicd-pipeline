output availability_zone {
    value       = var.availability_zone
    description = "The availability zone of the private subnet"
}
output private_subnet_name {
    value       = var.private_subnet_name
    description = "The name of the private subnet"
}
output private_subnet_id {
    value       = aws_subnet.main.id
    description = "The ID of the private subnet created"
}
output private_subnet_cidr_block {
    value       = var.cidr_block
    description = "The CIDR block of the private subnet"
}
