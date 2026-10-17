resource "aws_nat_gateway" "nat" {
  vpc_id            = aws_vpc.vpc.id
  availability_mode = "regional"

    tags = {
    Name = "${var.environment}_nat"
  }

  depends_on = [aws_internet_gateway.gw]
}