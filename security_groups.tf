resource "aws_security_group" "custom_sg" {
  name        = "Custom Security Group"
  description = "Custom Security Group"
  vpc_id      = aws_vpc.custom_vpc.id
  tags = {
    Name = "Custom Security Group"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.custom_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.custom_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.custom_sg.id

  cidr_ipv4   = "49.37.153.163/32" #Change it your own IP
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}


## Outbound Traffic open for all 

resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.custom_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = -1
  ip_protocol = "all"
  to_port     = -1
}