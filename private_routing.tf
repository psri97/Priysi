resource "aws_route_table" "terraform-private"{
  vpc_id = aws_vpc.default.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT-GW.id
  }

  tags = {
    Name = "${var.vpc_name}-Private-RT"
    Env  = var.env
  }
}

resource "aws_route_table_association" "terraform-private-subnets" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.Private-Subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-private.id
}