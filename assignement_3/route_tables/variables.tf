variable "vpc_id" {
  description = "VPC ID"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
}

variable "destination_cidr_block" {
  description = "CIDR block for the route"
}

variable "gateway_id" {
  description = "Gateway ID for the route"
}

variable "name" {
  description = "Name of the Route Table"
}
