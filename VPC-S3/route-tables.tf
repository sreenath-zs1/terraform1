resource "aws_route_table" "route-public" {
  vpc_id = "${aws_vpc.vpc_1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "public-route-table-demo"
  }
}


resource "aws_route_table_association" "public_1" {
  subnet_id      = "${aws_subnet.public-1.id}"
  route_table_id = "${aws_route_table.route-public.id}"
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = "${aws_subnet.public-2.id}"
  route_table_id = "${aws_route_table.route-public.id}"
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = "${aws_subnet.public-3.id}"
  route_table_id = "${aws_route_table.route-public.id}"
}