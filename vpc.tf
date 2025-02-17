
# Provider configuration
provider "aws" {
  region = var.region
}


# Creating VPC

resource "aws_vpc" "project-8" {
  cidr_block         = var.vpc_cidr_block 
  instance_tenancy   = var.instance_tenancy
  enable_dns_hostnames = var.dns_hostname

  tags = {
    Name1 = var.tags
  }
}



# Suubnets

# Creating Public Subnet

resource "aws_subnet" "project-8-pub-sub1" {
  vpc_id       = aws_vpc.project-8.id
  cidr_block  = var.project-8-pub-sub1_cidr-block
  availability_zone = var.pub_sub1_zone

  map_public_ip_on_launch = true

  tags = {
    Name2 = var.subnet_tags1
  }
}


resource "aws_subnet" "project-8-pub-sub2" {
  vpc_id     = aws_vpc.project-8.id
  cidr_block = var.project-8-pub-sub2_cidr-block
  availability_zone = var.pub_sub2_zone

map_public_ip_on_launch = true

  tags = {
    Name3 = var.subnet_tags2
  }
}

# Creating Private subnet
resource "aws_subnet" "project-8-priv-sub1" {
  vpc_id     = aws_vpc.project-8.id
  cidr_block = var.priv-sub1-cidr_block
  availability_zone = var.priv_sub1_zone

  tags = {
    Name4 = var.tags_priv1
  }
}


resource "aws_subnet" "project-8-priv-sub2" {
  vpc_id     = aws_vpc.project-8.id
  cidr_block = var.priv-sub2-cidr_block
  availability_zone = var.priv_sub2_zone

  tags = {
    Name5 = var.sunet_tags3
  }
}



# Creating Public Route table
resource "aws_route_table" "project-8-pub-route-table" {
  vpc_id = aws_vpc.project-8.id

  tags = {
    Name6 = var.tags_project-8-pub-route-table
  }
} 

# Creating Private Route table
resource "aws_route_table" "project-8-priv-route-table" {
  vpc_id = aws_vpc.project-8.id

  tags = {
    Name7 = var.tags_project-8-priv-route-table
  }
}

# Creating Route in the route table to point the Internet gateway
resource "aws_route" "igw-route" {
  route_table_id            = aws_route_table.project-8-pub-route-table.id
  destination_cidr_block    = var.igw_route_cidr
  gateway_id               = aws_internet_gateway.project-8-igw.id
}




# Subnets Route tables association

# Public Subnet Route Associate
resource "aws_route_table_association" "subnet-public-route-association-1" {
  subnet_id      = aws_subnet.project-8-pub-sub1.id
  route_table_id = aws_route_table.project-8-pub-route-table.id
}

resource "aws_route_table_association" "subnet-public-route-association-2" {
  subnet_id      = aws_subnet.project-8-pub-sub2.id
  route_table_id = aws_route_table.project-8-pub-route-table.id
}


# Private Subnet Route Associate
resource "aws_route_table_association" "subnet-private-route-association-1" {
  subnet_id      = aws_subnet.project-8-priv-sub1.id
  route_table_id = aws_route_table.project-8-priv-route-table.id
}


resource "aws_route_table_association" "subnet-private-route-association-2" {
  subnet_id      = aws_subnet.project-8-priv-sub2.id
  route_table_id = aws_route_table.project-8-priv-route-table.id
}


# Internet Gateway
resource "aws_internet_gateway" "project-8-igw" {
  vpc_id = aws_vpc.project-8.id

  tags = {
    Name8 = var.tags_igw
  }
}


# Elastic IP for Nat Gateway
resource "aws_eip" "nat-eip" {
    domain     = var.nat-eip_domain

    tags = {
     Name9 = var.nat-eip
    }
}


# Creating Nat Gateway
resource "aws_nat_gateway" "nat-gateway" {
    allocation_id   = aws_eip.nat-eip.id
    subnet_id       = aws_subnet.project-8-pub-sub1.id 
    tags    = {
        Name10 = var.nat-gateway
    }   
}


