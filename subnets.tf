resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.10.32.0/19"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-2a"

  tags = {
    Name = "Public Subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.10.64.0/19"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-2b"

  tags = {
    Name = "Public Subnet 2"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.10.96.0/19"
  map_public_ip_on_launch = "true"
  availability_zone       = "ap-south-2c"

  tags = {
    Name = "Public Subnet 3"
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.10.128.0/19"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-2a"

  tags = {
    Name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.10.160.0/19"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-2b"

  tags = {
    Name = "Private Subnet 2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id                  = aws_vpc.custom_vpc.id
  cidr_block              = "10.10.192.0/19"
  map_public_ip_on_launch = "false"
  availability_zone       = "ap-south-2c"

  tags = {
    Name = "Private Subnet 3"
  }
}

## "old_cidr_block": "10.10.1.0/24", "10.10.2.0/24","10.10.3.0/24","10.10.4.0/24","10.10.5.0/24"