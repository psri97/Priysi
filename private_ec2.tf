resource "aws_instance" "private-servers" {
  count                       = 1
  ami                         = var.imagename
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.Private-Subnets.*.id, count.index)
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = false
  tags = {
    Name       = "${var.vpc_name}-${var.env}-PrivateServer-${count.index + 1}"
    Env        = var.env
    Owner      = "Priya"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
		#! /bin/bash
        sudo apt-get update
		sudo apt-get install -y nginx jq net-tools
		echo "<h1>${var.vpc_name}-${var.env}-PrivateServer-${count.index + 1}</h1>" | sudo tee /var/www/html/index.nginx-debian.html
	EOF

  depends_on = [aws_nat_gateway.NAT-GW]
}