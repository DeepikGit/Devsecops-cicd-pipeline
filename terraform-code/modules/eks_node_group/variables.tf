variable "cluster_name" {
  type = string
}

variable "node_group_name" {
  type = string
}

variable "node_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "desired_size" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 3
}

variable "min_size" {
  type    = number
  default = 1
}

variable "disk_size" {
  type    = number
  default = 20
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

variable "ec2_ssh_key" {
  type = string
}

variable "environment" {
  type = string
}

variable "security_group_id" {
  type = string
}