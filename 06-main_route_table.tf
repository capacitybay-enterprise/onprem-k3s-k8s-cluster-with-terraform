data "aws_route_table" "default-route-table" {
  vpc_id = aws_vpc.vpc.id

  filter {
    name = "association.main"
    values = [ "true" ]
  }
}


resource "aws_default_route_table" "default_route" {
  default_route_table_id = data.aws_route_table.default-route-table.id

  tags = {
    Name = "${var.environment}_Main_Public_route_table"
  }
}
