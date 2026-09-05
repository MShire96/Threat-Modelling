### VPC ###
resource "aws_vpc" "threat" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "threat-vpc"
  }
}

#### IGW ####
resource "aws_internet_gateway" "threat-igw" {
  vpc_id = aws_vpc.threat.id
}


#### SUBNETS A ###
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.threat.id
  cidr_block = var.subnet_cidr_pua
}

### ROUTE TABLE ###
resource "aws_route_table" "public_a" {
  vpc_id = aws_vpc.threat.id
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public_a.id
}


resource "aws_route" "public_internet_access_a" {
  route_table_id         = aws_route_table.public_a.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.threat-igw.id
}

#### SUBNETS B ###
resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.threat.id
  cidr_block = var.subnet_cidr_pub
}

resource "aws_route_table" "public_b" {
  vpc_id = aws_vpc.threat.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public_b.id
}

resource "aws_route" "public_internet_access_b" {
  route_table_id         = aws_route_table.public_b.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.threat-igw.id
}