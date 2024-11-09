variable "aws_region" {
  description = "AWS region where the EC2 instance will be created"
  type        = string
  default     = "us-west-2" # Replace with preferred region
}

variable "ami_id" {
  description = "The AMI ID for the instance (e.g., Amazon Linux 2)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type (e.g., t2.micro)"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name to access the instance"
  type        = string
  default     = null
}

variable "instance_name" {
  description = "Tag for the instance name"
  type        = string
  default     = "MyEC2Instance"
}

variable "security_group_ids" {
  description = "List of security group IDs"
  type        = list(string)
  default     = []
}

variable "subnet_id" {
  description = "Subnet ID in which the instance will be deployed"
  type        = string
  default     = null
}

variable "volume_size" {
  description = "Size of the root EBS volume in GB"
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Type of the root EBS volume"
  type        = string
  default     = "gp2"
}
