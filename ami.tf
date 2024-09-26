data "aws_ami" "ami" {
  most_recent = true
  owners      = ["099720109477"] #Owner fetched from AMI Section of EC2 Console

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  # This filter is fetched from EC2 Console under AMI section
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

