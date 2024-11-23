resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-0866a3c8686eaeeba"  # Replace with your desired AMI ID
  instance_type = "t2.medium"

  # Add a key pair for SSH access
  key_name = "newkey"  # Ensure this key pair exists in AWS and matches your local .pem file

  # Use the correct security group ID
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # Associate the instance with the specified subnet
  subnet_id = data.aws_subnet.subnet_01.id

  # Root Block Device Configuration
  root_block_device {
    volume_size           = 30    # Increased size to 40 GB
    volume_type           = "gp3" # Set volume type to gp3
    delete_on_termination = true  # Ensure volume is deleted when instance is terminated
  }


  # Tags for the EC2 instance
  tags = {
    "Name"           = "apache-web-for del"  # Corrected Name tag
    "owner"          = "EK TECH SOFTWARE SOLUTION"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}
