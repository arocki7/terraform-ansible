output "sg_tf_web" {
  value = "${aws_security_group.test-web.id}"
}

output "tf_web_dns" {
  value = "${aws_lb.tf-lb.dns_name}"
}
