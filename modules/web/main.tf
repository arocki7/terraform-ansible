# Create an EC2 instance
resource "aws_instance" "web" {
  # AMI ID for CentOS
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name      =  "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.test-web.id}"]
  subnet_id = "${var.subnet_id}"

  tags {
    Name = "Web",
    CR = "SHUTDOWN"
  }
}
