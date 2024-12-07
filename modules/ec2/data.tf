data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = ["main_vpc"] # Replace with the actual Name tag value of your VPC
  }
}

data "aws_subnet" "main_subnet" {
  filter {
    name   = "tag:Name"
    values = ["main_subnet"]
  }
}
data "aws_ami" "my_ami" {
  filter {
    name   = "tag:Name"
    values = ["s8anatoleimage"]
  }
}

