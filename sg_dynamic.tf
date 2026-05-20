locals {
  rules = [
    {
      description = "Allows http traffic",
      port        = 80,
      cidr_blocks = ["0.0.0.0/0"],
    },
    {
      description = "Allows https traffic",
      port        = 443,
      cidr_blocks = ["10.0.0.0/16"],
    },
    {
      description = "Allows https traffic",
      port        = 443,
      cidr_blocks = ["10.0.0.0/16"],
    }
  ]
}

locals {
  egress_rules = [
    {
      description = "Allows http traffic",
      port        = 8080,
      cidr_blocks = ["0.0.0.0/0"],
    },
    {
      description = "Allows https traffic",
      port        = 3306,
      cidr_blocks = ["10.0.0.0/16"],
    }
  ]
}


resource "aws_security_group" "app_sg" {
  name        = "App-sg"
  description = "App-sg"
  vpc_id      = aws_vpc.default.id
  dynamic "ingress" {
    for_each = local.rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = local.egress_rules
    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = "tcp"
      cidr_blocks = egress.value.cidr_blocks
    }
  }
}