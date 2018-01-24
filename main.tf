# Configure the AWS Provider
provider "aws" {
  region = "${var.region}"
}

module "web" {
  source = "modules/web"

  key_name = "${var.key_name}"
  subnet_id = "${aws_subnet.tf-weba.id}"
  subnet_weba = "${aws_subnet.tf-weba.id}"
  subnet_webb = "${aws_subnet.tf-webb.id}"
  vpc_id = "${aws_vpc.tf-vpc.id}"
}
