# Create Autolaunch configuration
resource "aws_launch_configuration" "al-tf-web" {
  name = "al-tf-web"
  instance_type  = "t2.micro"
  image_id       = "${var.ami}"
  security_groups = ["${aws_security_group.test-web.id}"]
  key_name      =  "${var.key_name}"
  user_data = "${data.template_file.installnginx.rendered}"

  lifecycle {
    create_before_destroy = true
  }

}

# Create AutoScaling group
resource "aws_autoscaling_group" "as-tf-web" {
  name = "as-tf-web"
  launch_configuration = "${aws_launch_configuration.al-tf-web.name}"
  min_size = 1
  max_size = 2
  desired_capacity = 1
  target_group_arns = ["${aws_lb_target_group.tf-tg.arn}"]
  vpc_zone_identifier = ["${var.subnet_weba}","${var.subnet_webb}"]

  lifecycle {
  create_before_destroy = true
  }

  tags = [
    {
      key                 = "CR"
      value               = "SHUTDOWN"
      propagate_at_launch = true
    },
    {
      key                 = "Name"
      value               = "TF-Web"
      propagate_at_launch = true
    },
  ]
}


data "template_file" "installnginx" {
  template = "${file("${path.module}/installnginx.tpl")}"
}
