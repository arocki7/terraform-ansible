output "url" {
  value = "http://${aws_instance.web.public_ip}"
}

output "public_ip" {
  value = "${aws_instance.web.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.web.private_ip}"
}

output "sg_tf_web" {
  value = "${aws_security_group.test-web.id}"
}

output "tf_web_dns" {
  value = "${aws_lb.tf-lb.dns_name}"
}
