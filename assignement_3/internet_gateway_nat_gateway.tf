resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name           = "s8anatole-igw"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

resource "aws_nat_gateway" "nat" {
  count         = var.nat_gateway ? length(var.public_subnet_cidrs) : 0
  subnet_id     = aws_subnet.public[0].id
  allocation_id = aws_eip.nat[count.index].id
  tags = {
    Name           = "s8anatole-nat-gateway-${count.index + 1}"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

resource "aws_eip" "nat" {
  count  = var.nat_gateway ? length(var.public_subnet_cidrs) : 0
  domain = "vpc"
  tags = {
    Name           = "s8anatole-nat-eip-${count.index + 1}"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}
