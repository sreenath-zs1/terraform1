resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.public-1.id}"
  depends_on    = [aws_internet_gateway.gw]
}


resource "aws_route_table" "route_private" {
  vpc_id = "${aws_vpc.vpc_1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags = {
    Name = "private-route-table-demo"
  }
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = "${aws_subnet.private-1.id}"
  route_table_id = "${aws_route_table.route_private.id}"
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = "${aws_subnet.private-2.id}"
  route_table_id = "${aws_route_table.route_private.id}"
}
resource "aws_route_table_association" "private_3" {
  subnet_id      = "${aws_subnet.private-3.id}"
  route_table_id = "${aws_route_table.route_private.id}"
}