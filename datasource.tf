data "aws_vpc" "Default"{
id = "vpc-0a48f4eaf50778181"
}
data "aws_subnet" "Default" {
id = "subnet-09c7a22df94861aba"
}
data "aws_security_group" "Default" {
id = "sg-0b57664751591f0ec"
}
resource "aws_instance" "Priya2" {
ami = var.imagename
instance_type = "t3.micro"
key_name = var.key_name
subnet_id = data.aws_subnet.Default.id
vpc_security_group_ids = ["${data.aws_security_group.Default.id}"]
associate_public_ip_address = true
tags = {
Name = "Priya2"
Env = "Prod"
Owner = "Priya"
CostCenter = "ABCD"
}
}