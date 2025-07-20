output subnet_name {
    value       = var.subnet_name
    description = "The name of the public subnet"
}

output subnet_id {
    value       = aws_subnet.main.id
    description = "The ID of the public subnet created"
}

output subnet_cidr_block {
    value       = var.cidr_block
    description = "The CIDR block of the public subnet"
}
output availability_zone {
    value       = var.availability_zone
    description = "The availability zone of the public subnet"
}