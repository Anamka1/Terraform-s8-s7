resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidrs)
  vpc_id                 = var.vpc_id
  cidr_block             = var.subnet_cidrs[count.index]
  availability_zone      = var.availability_zones[count.index]
  map_public_ip_on_launch = var.public_subnet

  tags = {
    Name = "${var.name_prefix}-${count.index + 1}"
  }
}
