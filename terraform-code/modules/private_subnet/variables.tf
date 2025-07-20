variable vpc_id {  
    type        = string
    description = "The ID of the VPC where the subnet will be created"
}
variable cidr_block {
    type        = string
    description = "The CIDR block for the private subnet"
}
variable availability_zone {
    type        = string
    description = "The availability zone in which the subnet will be created"
}
variable private_subnet_name {
    type        = string
    description = "The name to be assigned to the subnet"
}