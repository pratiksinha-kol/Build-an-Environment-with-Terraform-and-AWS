# You need to create key pair beforehand for this step: 
# Command Used: 'ssh-keygen -t ed25519 -C terraform_kp'

# You can use file provisioners to copy the "FILE" from source to destination

resource "aws_key_pair" "custom_key_pair" {
  key_name   = "custom-key-pair"
  public_key = file("~/.ssh/terraform.pub")
}


########################################

# Alternatively, you can also use this approach by using cat command to see the public key and paste it here

# resource "aws_key_pair" "custom_key_pair" {
#   key_name   = "deployer-key"
#   public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL656qkPvjRt3BjNq+CWpOeefM0Lch6InCAK+IbnhZjF terraform_kp"
# }