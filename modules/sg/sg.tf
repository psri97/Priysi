resource "aws_security_group" "app_sg" {
  name        = "${var.vpc_name}-allow-all"
  description = "app traffic sg"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = "-1"
      cidr_blocks = egress.value.cidr_blocks
    }
  }
tags = {
    Name        = "${var.vpc_name}-allow-all"
    environment = "${var.env}"
  }
}