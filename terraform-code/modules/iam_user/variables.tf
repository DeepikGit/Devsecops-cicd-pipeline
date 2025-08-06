variable "policy_arn" {
  description = "IAM Policy ARN to attach to the user"
  type        = string
  default     = "arn:aws:iam::aws:policy/AdministratorAccess"
}