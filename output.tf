output "vpc_id" {
    description = "this is the vpc id"
    value = aws_vpc.vpc.id
}

output "ava_zone_01" {
    description = "ava zone 01"
    value = data.aws_availability_zones.available.names[0]
  
}

output "main_route_id" {
    description = "route table id"
    value = data.aws_route_table.default-route-table.id
  
}

output "ec2_public_Ip" {
    description = "public ip address"
    value = aws_instance.example.public_ip
  
}