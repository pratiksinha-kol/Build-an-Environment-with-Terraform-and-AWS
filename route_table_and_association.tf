resource "aws_route_table" "public_custom_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "10.10.0.0/16"
    gateway_id = "local"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }


  tags = {
    Name = "Public Custom Route Table"
  }
}

resource "aws_route_table" "private_custom_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "10.10.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "Private Custom Route Table"
  }
}


resource "aws_route_table_association" "public_rta1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_custom_rt.id
}

resource "aws_route_table_association" "public_rta2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_custom_rt.id
}

resource "aws_route_table_association" "public_rta3" {
  subnet_id      = aws_subnet.public_subnet_3.id
  route_table_id = aws_route_table.public_custom_rt.id
}

resource "aws_route_table_association" "private_rta1" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_custom_rt.id
}

resource "aws_route_table_association" "private_rta2" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_custom_rt.id
}

resource "aws_route_table_association" "private_rta3" {
  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_custom_rt.id
}