resource "aws_subnet" "private_subnet_01" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_01
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "${var.environment}_private_subnet_01"
    Owner = var.Owner
  }
}

# private subnet 01 route table association
resource "aws_route_table_association" "priv-01" {
  subnet_id      = aws_subnet.private_subnet_01.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_subnet" "private_subnet_02" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_02
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "${var.environment}_private_subnet_02"
    Owner = var.Owner
  }
}

# private subnet 01 route table association
resource "aws_route_table_association" "priv-02" {
  subnet_id      = aws_subnet.private_subnet_02.id
  route_table_id = aws_route_table.private-route-table.id
}