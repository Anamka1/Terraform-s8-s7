provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Optional: Add a key pair for SSH access
  key_name = var.key_name

  # Optional: Add tags for better organization and management
  tags = {
    Name = var.instance_name
  }
 
}
