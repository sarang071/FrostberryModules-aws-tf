#=============================================
# Create VPC
#=============================================
resource "aws_vpc" "this_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
}
#=============================================
# Public subnets
#=============================================
resource "aws_subnet" "public_subnet" {
  count             = 2
  vpc_id            = aws_vpc.this_vpc.id
  cidr_block        = element (var.public_subnet_cidr,count.index)
  availability_zone = element (var.availability_zone,count.index)
}
#=============================================
# Private subnets
#=============================================
resource "aws_subnet" "private_subnet" {
  count             = 2
  vpc_id            = aws_vpc.this_vpc.id
  cidr_block        = element(var.private_subnet_cidr,count.index)
  availability_zone = element(var.availability_zone,count.index)
}
#=============================================
# Create IGW and NAT
#=============================================
resource "aws_internet_gateway" "this_igw" {
  vpc_id = aws_vpc.this_vpc.id
}
resource "aws_eip" "eip" {
  vpc = true
}
resource "aws_nat_gateway" "this_nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
}
#=============================================
# Create Route tables
#=============================================
resource "aws_route_table" "this_public_route_table" {
  vpc_id = aws_vpc.this_vpc.id
}
resource "aws_route_table" "this_private_route_table" {
  vpc_id = aws_vpc.this_vpc.id
}
#=============================================
# Create Route
#=============================================
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.this_public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this_igw.id
}
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.this_private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.this_nat.id
}
#==============================================
# Create Associations
#==============================================
resource "aws_route_table_association" "pub-asso" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.this_public_route_table.id
}
resource "aws_route_table_association" "pri-asso" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.this_private_route_table.id
}
