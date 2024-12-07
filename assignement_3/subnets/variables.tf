variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
}

variable "availability_zones" {
  description = "List of availability zones"
}

variable "name_prefix" {
  description = "Prefix for subnet names"
}

variable "public_subnet" {
  description = "Whether to enable public IP on subnets"
  default     = false
}
