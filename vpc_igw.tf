resource "aws_vpc" "custom_vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = "true"
  enable_dns_support   = "true"

  tags = {
    Name = "Custom VPC"
  }
}

## Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "Custom IGW"
  }
}


