variable "vpc_id" {
  type        = string
  description = "VPC ID where the security group will be created"
}

variable "admin_cidr" {
  type        = string
  description = "Trusted CIDR allowed to access SSH"
}