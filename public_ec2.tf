resource "aws_instance" "Priya1" {
  ami                         = var.imagename
  availability_zone           = "us-east-1a"
  instance_type               = "t3.micro"
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Priya1"
    Env        = "Dev"
    Owner      = "Priya"
    CostCenter = "ABCD"
  }
  #   lifecycle {
  #     prevent_destroy = true
  #   }
}
