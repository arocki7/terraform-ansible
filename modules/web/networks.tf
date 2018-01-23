# Create the security group for web server
resource "aws_security_group" "test-web" {
  name = "test-web"
  description = "Security Group for Web Server"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "test-web"
  }
}


# Create the security group for web server
resource "aws_security_group" "test-lb" {
  name = "test-lb"
  description = "Security Group for Web Server"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "test-lb"
  }
}


# Create target group for the web servers.
resource "aws_lb_target_group" "tf-tg" {
  name = "tf-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = "${var.vpc_id}"
}

# Create AWS Application Load Balancer for Web
resource "aws_lb" "tf-lb" {
  name = "tf-lb"
  internal = false
  security_groups = ["${aws_security_group.test-lb.id}"]
  subnets = ["${var.subnet_weba}","${var.subnet_webb}"]

  tags {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = "${aws_lb.tf-lb.arn}"
  port = 80
  protocol = "HTTP"

  default_action {
  target_group_arn = "${aws_lb_target_group.tf-tg.arn}"
  type = "forward"
  }
}
