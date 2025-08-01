output ami{
  value = var.ami
  description = "The AMI used for the EC2 instance"
}
output key_name {
  value = var.key_name
  description = "The key name used for the EC2 instance"
}
output instance_type {
  value = var.instance_type
  description = "The type of instance created"
}
/* output subnet_id {
  value = var.subnet_id
  description = "The ID of the subnet where the instance is launched"
}
output vpc_security_group_ids {
  value = var.vpc_security_group_ids
  description = "List of security group IDs associated with the instance"
}*/
output name {
  value = var.name
  description = "The name tag of the EC2 instance"
}
