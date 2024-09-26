terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.68.0"
    }
  }
}

provider "aws" {
  # Configuration options
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile                  = "vscode"
  region                   = "ap-south-2"
}