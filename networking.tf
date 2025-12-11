resource "aws_vpc" "exam_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "exam-vpc-jamiya" 
  }
}

resource "aws_internet_gateway" "exam_igw" {
  vpc_id = aws_vpc.exam_vpc.id
  tags = {
    Name = "exam-igw"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.exam_vpc.id
  cidr_block              = var.public_subnet_cidr # 10.0.1.0/24
  map_public_ip_on_launch = true 
  availability_zone       = "${var.region}a"
  tags = {
    Name = "exam-public-subnet"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.exam_vpc.id
  tags = {
    Name = "exam-public-rt"
  }
}

resource "aws_route" "default_internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.exam_igw.id
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}