resource "null_resource" "cluster" {
  count = var.env == "PROD" ? 1 : 1
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("rabi.pem")
      #host = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update -y",
      "sudo apt install nginx -y",
      "sudo systemctl start nginx",
      "sudo apt install jq unzip net-tools -y",
      "curl -o https://get.docker.com |sudo bash"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("rabi.pem")
      #host = "${aws_instance.web-1.public_ip}"
      host = element(aws_instance.public-servers.*.public_ip, count.index)
    }
  }
  provisioner "local-exec" {
    command = <<EOH
echo "${element(aws_instance.public-servers.*.public_ip, count.index)}" >> public_server_details_1 && echo "${element(aws_instance.public-servers.*.private_ip, count.index)}" >> public_server_details_2,
EOH
  }
}