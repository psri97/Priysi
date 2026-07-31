output "vpc-id" {
  value = aws_vpc.default.id
}

output "public-subnet1-id" {
  value = aws_subnet.Public-Subnets.0.id
}

output "public-subnet2-id" {
  value = aws_subnet.Public-Subnets.1.id
}

output "public-subnet3-id" {
  value = aws_subnet.Public-Subnets.2.id
}

output "public-subnets-id" {
  value = aws_subnet.Public-Subnets.*.id
}

output "private-subnet1-id" {
  value = aws_subnet.Private-Subnets.0.id
}

output "private-subnet2-id" {
  value = aws_subnet.Private-Subnets.1.id
}

output "private-subnet3-id" {
  value = aws_subnet.Private-Subnets.2.id
}

output "private-subnets-id" {
  value = aws_subnet.Private-Subnets.*.id
}