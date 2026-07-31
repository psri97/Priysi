output private_servers {
  value       = "${aws_instance.private-servers.*.id}"
}
output public_servers {
  value       = "${aws_instance.public-servers.*.id}"
}

output "public-server-ips" {
  value = aws_instance.public-servers[*].public_ip
}

output "private-server-ips" {
  value = aws_instance.private-servers[*].private_ip
}