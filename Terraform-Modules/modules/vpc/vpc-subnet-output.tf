resource "aws_vpc" "vpc_module" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags {
    Name = "vpc_module"
  }
}

resource "aws_subnet" "vpc_module_subnet" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet_cidr}"

  tags {
    Name = "vpc_subnet"
  }
}

output "vpc_id" {
  value = "${aws_vpc.vpc_module.id}"
}

output "subnet_id" {
  value = "${aws_subnet.vpc_module_subnet.id}"
}