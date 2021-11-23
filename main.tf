#Creating the VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
      Name = var.vpc_name
  }
}
#Creating the Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = var.internet_gw_name
  }
}
#Creating Public Subnet A
resource "aws_subnet" "public_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_a_cidr
  availability_zone = "${var.region}a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-a"
  }
}
#Creating Public Subnet B
resource "aws_subnet" "public_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_b_cidr
  availability_zone = "${var.region}b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-b"
  }
}
#Creating Public Subnet C
resource "aws_subnet" "public_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.public_c_cidr
  availability_zone = "${var.region}c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-c"
  }
}
#Creating Private Subnet A

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_a_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private-a"
  }
}
#Creating Private Subnet B

resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_b_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "Private-b"
  }
}
#Creating Private Subnet C

resource "aws_subnet" "private_c" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = var.private_c_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "Private-c"
  }
}

#Creating Elastic IP for NAT Gateway PubSubA
resource "aws_eip" "nat_a_eip" {
  vpc      = true
}
#Creating NAT Gateway for PubSubA
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a_eip.id
  subnet_id     = aws_subnet.public_a.id

  tags = {
    Name = "NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
#Creating EIP for NAT Gatewat PubSubB
resource "aws_eip" "nat_b_eip" {
  vpc      = true
}
#Creating NAT Gateway for PubSubB
resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b_eip.id
  subnet_id     = aws_subnet.public_b.id

  tags = {
    Name = "NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}
#Creating EIP for NAT Gateway for PubSubC
resource "aws_eip" "nat_c_eip" {
  vpc      = true
}
#Creating NAT Gateway for PubSubC
resource "aws_nat_gateway" "nat_c" {
  allocation_id = aws_eip.nat_c_eip.id
  subnet_id     = aws_subnet.public_c.id

  tags = {
    Name = "NAT Gateway"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}


