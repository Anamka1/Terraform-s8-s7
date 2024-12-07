# Declare availability zones data resource
data "aws_availability_zones" "available" {
  state = "available"
}

# Declare the VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name           = "s8anatole-vpc"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

# Declare Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name           = "s8anatole-public-subnet-${count.index + 1}"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

# Declare Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnet_cidrs[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index + length(var.public_subnet_cidrs))
  tags = {
    Name           = "s8anatole-private-subnet-${count.index + 1}"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

# Declare Elastic IP for NAT Gateway
resource "aws_eip" "nat" {
  count = var.nat_gateway ? length(var.public_subnet_cidrs) : 0
  domain = "vpc"  # Corrected from deprecated vpc = true

  tags = {
    Name           = "s8anatole-nat-eip-${count.index + 1}"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}
