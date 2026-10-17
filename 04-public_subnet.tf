resource "aws_subnet" "public_subnet_01" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_01
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}_public_subnet_01"
    Owner = var.Owner
  }
}

# public subnet 01route table association
resource "aws_route_table_association" "pub-01" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = data.aws_route_table.default-route-table.id
}


resource "aws_subnet" "public_subnet_02" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_02
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.environment}_public_subnet_02"
    Owner = var.Owner
  }
}

# public subnet 02 route table association
resource "aws_route_table_association" "pub-02" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = data.aws_route_table.default-route-table.id
}