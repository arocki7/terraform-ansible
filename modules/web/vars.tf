variable "ami" {
  default = "ami-1a962263"
}

variable "key_name" {
  description = "SSH Key used for the servers."
}

variable "subnet_id" {
  description = "Subnet ID information for the Web servers."
}

variable "subnet_weba" {
  description = "Subnet ID information for EU-WEST-1A AZ"
}

variable "subnet_webb" {
  description = "Subnet ID information for EU-WEST-1B AZ"
}

variable "vpc_id" {
  description = "VPC ID information for TF servers."
}
