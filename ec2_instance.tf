resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"

  associate_public_ip_address = "true"
  key_name                    = aws_key_pair.custom_key_pair.id
  vpc_security_group_ids      = [aws_security_group.custom_sg.id]
  subnet_id                   = aws_subnet.public_subnet_2.id
  user_data                   = file("userdata.tpl")

  root_block_device {
    encrypted             = "true"
    delete_on_termination = "true"
    volume_size           = 10
  }

  # USE PROVISIONERS AS A LAST RESORT

  # For host using Linux OS 
  # local-exec provisioners executes ONLY on host running terraform NOT on terraform resources

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/terraform" #private key
    })
    # interpreter = ["bash", "-c"]
    interpreter = var.host_os == "linux" ? ["bash", "-c"] : ["Powershell", "-Command"]
  }

  # This invokes a process on the machine running Terraform, not on the resource. 
  # For host using Windows OS 

  #   provisioner "local-exec" {
  #     command = templatefile("${var.host_os}-ssh-config.tpl", {
  #       hostname = self.public_ip,
  #       user     = "ubuntu",
  #     identityfile = "~/.ssh/mtckey" })
  #     interpreter = ["Powershell", "-Command"]
  #   }

  tags = {
    Name = "EC2 Instance with Docker"
  }
}