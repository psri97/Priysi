resource "aws_route_table" "terraform-public" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.default.id
  }

  tags = {
    Name = "${var.vpc_name}-Public-RT"
    Env  = var.env
  }
}


resource "aws_route_table_association" "terraform-public-subnets" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.Public-Subnets.*.id, count.index)
  route_table_id = aws_route_table.terraform-public.id
}