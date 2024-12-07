resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name           = "s8anatole-public-route-table"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

resource "aws_route" "internet" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name           = "s8anatole-private-route-table"
    owner          = "Anatole Majyambere"
    environment    = "dev"
    project        = "del"
    created_by     = "Terraform"
    cloud_provider = "aws"
  }
}

resource "aws_route" "nat" {
  count                  = var.nat_gateway ? length(var.private_subnet_cidrs) : 0
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
