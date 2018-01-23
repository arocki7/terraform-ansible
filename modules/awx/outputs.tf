output "private_ip" {
  value = "${aws_instance.awx.private_ip}"
}

output "public_ip" {
  value = "${aws_instance.awx.public_ip}"
}
