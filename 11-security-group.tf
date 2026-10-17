resource "aws_security_group" "ec2_sg" {
  name        = "Ec2_Security_group"
  description = "Allow some traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "${var.environment}_ec2_sg"
  }
}

# Egress rule
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports

    tags = {
    Name = "${var.environment}_egress_allow_all"
  }
}


# Ingress rule 

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.ec2_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

      tags = {
    Name = "${var.environment}_ingress_allow_ssh"
  }
}