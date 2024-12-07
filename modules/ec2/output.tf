output "vpc_id" {
  value = data.aws_vpc.main_vpc.id
}

output "main_subnet" {
  value = data.aws_subnet.main_subnet
}

output "my_ami" {
  value = data.aws_ami.my_ami.id
}

# output "vpc_id" {
#   value = aws_vpc.main_vpc.id
# }

# output "main_subnet" {
#   value = aws_subnet.main_subnet.id
