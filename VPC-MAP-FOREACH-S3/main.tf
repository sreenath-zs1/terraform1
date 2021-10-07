terraform {
backend "s3" {
    bucket = "my-tf-test-bucket-sree-s123"
    region = "us-east-1"
    key    = "VPC/terraform.tfstate"
    #shared_credentials_file = "C:/Users/Sreenath/.aws/credentials"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}


provider "aws" {
  profile = "default"
  region  = "us-east-1"
  shared_credentials_file = "C:/Users/Sreenath/.aws/credentials"
}


resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
 
  tags = {
    Name        = "Terraform-vpc"
  }
}
 
resource "aws_subnet" "public" {
  for_each = var.public_subnet_numbers
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "Public-Subnet-vpc"
    Subnet      = "${each.key}-${each.value}"
  }
}
 
resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "Private-Subnet-vpc"
    Subnet      = "${each.key}-${each.value}"
  }
}
