output vpc_id {
  value       = aws_vpc.main.id
  description = "The ID of the VPC created"

}

output vpc_cidr_block {
  value       = aws_vpc.main.cidr_block
  description = "The CIDR block of the VPC"
}

output vpc_name {
  value       = var.vpc_name
  description = "The name of the VPC"
}
