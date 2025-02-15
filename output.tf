
output "vpc_cidr" {
  value = aws_vpc.project-8.cidr_block
  description = "the vpc cidr block for project 8"
}


output "vpc_tenanacy" {
  value = aws_vpc.project-8.instance_tenancy
  description = "the vpc tenancy for project 8"
}


output "vpc_id" {
  value = aws_subnet.project-8-pub-sub1.vpc_id
  description = "the vpc id for public subnet 1"
}


output "pub1_cidr_block" {
  value = aws_subnet.project-8-pub-sub1.cidr_block
  description = "the cidr block for public subnet 1"
}


output "vpc_id_priv_route" {
  value = aws_route_table.project-8-priv-route-table.vpc_id
  description = "the vpc id for private route table"
}



output "subnet_id_1" {
  value = aws_route_table_association.subnet-public-route-association-1.subnet_id
  description = "the subnet id for public route table association 1"
}


output "route_table_id_1" {
  value = aws_route_table_association.subnet-public-route-association-1.route_table_id
  description = "the route table id for public route table association 1"
}


output "nat_allocation_id1" {
  value = aws_nat_gateway.nat-gateway.allocation_id
  description = "the allocationid for nat gateway 1"
}



