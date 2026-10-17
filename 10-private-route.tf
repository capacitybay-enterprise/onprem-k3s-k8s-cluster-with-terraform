resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc.id

  # since this is exactly the route AWS will create, the route will be adopted
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "${var.environment}_private_route_table"
  }
}