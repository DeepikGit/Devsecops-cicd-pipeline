variable subnet_name {
  type        = string
  default     = "onmo-public-subnet"
  description = "this is the name of the public subnet"
}

variable cidr_block {
  type        = string
  description = "this is the CIDR block for the public subnet"
}
variable availability_zone {
  type        = string
  description = "this is the availability zone for the public subnet"
}

variable vpc_id {
  type        = string
  description = "this is the ID of the VPC"
}