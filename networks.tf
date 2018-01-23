resource "aws_vpc" "tf-vpc" {
  cidr_block = "172.21.0.0/16"
  tags {
  Name = "TF VPC - AWX"
  }
}

resource "aws_subnet" "tf-awx" {
  vpc_id = "${aws_vpc.tf-vpc.id}"
  cidr_block = "172.21.0.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
  tags {
  Name = "tf-awx"
  }
}

resource "aws_subnet" "tf-weba" {
  vpc_id = "${aws_vpc.tf-vpc.id}"
  cidr_block = "172.21.1.0/24"
  availability_zone = "eu-west-1a"
  map_public_ip_on_launch = true
  tags {
  Name = "tf-weba"
  }
}

resource "aws_subnet" "tf-webb" {
  vpc_id = "${aws_vpc.tf-vpc.id}"
  cidr_block = "172.21.2.0/24"
  availability_zone = "eu-west-1b"
  map_public_ip_on_launch = true
  tags {
  Name = "tf-webb"
  }
}

resource "aws_internet_gateway" "igw_tf" {
  vpc_id = "${aws_vpc.tf-vpc.id}"
  tags {
  Name = "TF - IGW"
  }
}

resource "aws_route" "rt_tf_web" {
  route_table_id         = "${aws_vpc.tf-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.igw_tf.id}"
}
