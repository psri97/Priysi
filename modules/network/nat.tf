resource "aws_eip" "nat-eip" {
}

resource "aws_nat_gateway" "NAT-GW" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.Public-Subnets.0.id

  tags = {
    Name = "NAT-GW"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.default]
}