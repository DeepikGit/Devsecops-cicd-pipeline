variable key_name {
  description = "The name of the key pair to use for SSH access to the EC2 instance"
  type        = string
  default     = null
}

variable ami {
  description = "The AMI to use for the instance"
  type        = string
}

variable instance_type {
  description = "The type of instance to create"
  type        = string
}

variable name {
  description = "The name of the EC2 instance"
  type        = string
}
/*variable subnet_id {
  description = "The ID of the subnet where the EC2 instance will be launched"
  type        = string
}
variable vpc_security_group_ids {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
}
*/
variable user_data {
  description = "User data to provide when launching the instance"
  type        = string
  default     = null
}

output "iam_user_name" {
  value = module.iam_user.iam_user_name
}

output "access_key_id" {
  value     = module.iam_user.access_key_id
  sensitive = true
}

output "secret_access_key" {
  value     = module.iam_user.secret_access_key
  sensitive = true
}
