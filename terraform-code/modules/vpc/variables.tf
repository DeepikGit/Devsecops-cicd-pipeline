variable vpc_name {
  type        = string
  default     = "mylab-vpc"
  description = "this is the name of the VPC"
}

variable cidr_block {
  type        = string
  description = "this is the CIDR block for the VPC"
}

