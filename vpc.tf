resource "aws_vpc" "Dev-VPC" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.Dev-VPC.id
  tags = {
    Name = "${var.vpc_name}-IGW"
  }
}

