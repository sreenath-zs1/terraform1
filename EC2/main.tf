terraform {
  # backend "s3" {
  #   bucket = "my-tf-test-bucket-sree-s123"
  #   region = "us-east-1"
  #   key    = "EC2/terraform.tfstate"
  #   shared_credentials_file = "C:/Users/Sreenath/.aws/credentials"
  # }

   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
  shared_credentials_file = "C:/Users/Sreenath/.aws/credentials"
}

resource "aws_instance" "ec2" {
  
  ami           = var.ec2_ami
  instance_type = var.instance_type
  count = var.ec2_count
  
  tags = {
    Name = "sree.${count.index+1}"
  }
}
