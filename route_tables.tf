#INTERNET GATEWAY - ROUTE TABLE

resource "aws_route_table" "igw_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "igw_route_table"
  }
}
#NAT GATEWAY - ROUTE TABLE
resource "aws_route_table" "private_to_public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_a.id
  }

  tags = {
    Name = "private_to_public"
  }
}

#ASSOCIATION TO PUBSUB A
resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.igw_route_table.id
}

#ASSOCIATION TO PUBSUB B
resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.igw_route_table.id
}

#ASSOCIATION TO PUBSUB C
resource "aws_route_table_association" "public_c" {
  subnet_id      = aws_subnet.public_c.id
  route_table_id = aws_route_table.igw_route_table.id
}
#ASSOCIATION TO PRIVSUB A
resource "aws_route_table_association" "private_a" {
    subnet_id = aws_subnet.private_a.id
    route_table_id = aws_route_table.private_to_public_rt.id
}
#ASSOCIATION TO PRIVSUB B
resource "aws_route_table_association" "private_b" {
    subnet_id = aws_subnet.private_b.id
    route_table_id = aws_route_table.private_to_public_rt.id
}
#ASSOCIATION TO PRIVSUB C
resource "aws_route_table_association" "private_c" {
    subnet_id = aws_subnet.private_c.id
    route_table_id = aws_route_table.private_to_public_rt.id
}