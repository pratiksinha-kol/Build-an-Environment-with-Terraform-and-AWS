output "vpc_id" {
  description = "ID of custom VPC is: "
  value       = aws_vpc.custom_vpc.id
}

# output "igw_id" {
#   value       = aws_internet_gateway.igw.id
#   description = "Internet Gateway ID"
# }

output "ami_id" {
  value = data.aws_ami.ami.id
}

output "aws_key_pair_id" {
  value       = aws_key_pair.custom_key_pair.id
  description = "ID of newly created Key Pair"
}

output "ec2_public_ip" {
  value       = aws_instance.my_ec2.public_ip
  description = "Public IP of the EC2 instance"
}

output "ec2_private_ip" {
  value       = aws_instance.my_ec2.private_ip
  description = "Public IP of the EC2 instance"
}

output "ec2_public_dns" {
  value       = aws_instance.my_ec2.public_dns
  description = "Public DNS of the EC2 Instance"
}