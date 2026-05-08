resource "aws_subnet" "subnet1-private" {
  vpc_id            = "${aws_vpc.Dev-VPC.id}"
  cidr_block        = var.private_subnet1_cidr
  availability_zone = "us-east-1a"

  tags = {
    Name = "${var.private_subnet1_name}"
  }
}

resource "aws_subnet" "subnet2-private" {
  vpc_id            = "${aws_vpc.Dev-VPC.id}"
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "${var.private_subnet2_name}"
  }
}

resource "aws_subnet" "subnet3-private" {
  vpc_id            = "${aws_vpc.Dev-VPC.id}"
  cidr_block        = var.private_subnet3_cidr
  availability_zone = "us-east-1c"

  tags = {
    Name = "${var.private_subnet3_name}"
  }

}