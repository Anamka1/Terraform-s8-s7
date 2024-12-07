resource "aws_route_table" "main" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.name
  }
}

resource "aws_route" "route" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = var.gateway_id
}

resource "aws_route_table_association" "subnets" {
  count          = length(var.subnet_ids)
  subnet_id      = var.subnet_ids[count.index]
  route_table_id = aws_route_table.main.id
}
