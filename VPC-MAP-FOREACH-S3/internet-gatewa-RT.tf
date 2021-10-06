resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    Name        = "Terraform-InternetGW"
  }
}
 
resource "aws_eip" "nat" {
  vpc = true 
  tags = {
    Name        = "Terraform-eip"
    VPC         = aws_vpc.vpc.id
  }
}
 
resource "aws_nat_gateway" "ngw" {
  allocation_id = aws_eip.nat.id
  subnet_id = aws_subnet.public[element(keys(aws_subnet.public), 0)].id
 
  tags = {
    Name        = "Terraform-ngw"
    VPC         = aws_vpc.vpc.id
  }
}
 
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    Name        = "Terraform-public-rt"
    VPC         = aws_vpc.vpc.id
  }
}
 
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    Name        = "Terraform-private-rt"
    VPC         = aws_vpc.vpc.id
  }
}
 
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}
 
resource "aws_route" "private" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.ngw.id
}



resource "aws_route_table_association" "public" {
  for_each  = aws_subnet.public
  subnet_id = aws_subnet.public[each.key].id
 
  route_table_id = aws_route_table.public.id
}
 
resource "aws_route_table_association" "private" {
  for_each  = aws_subnet.private
  subnet_id = aws_subnet.private[each.key].id
 
  route_table_id = aws_route_table.private.id
}