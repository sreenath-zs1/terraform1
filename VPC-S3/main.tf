terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-sree-s123"
    region = "us-east-1"
    key    = "VPC/terraform.tfstate"
    access_key = "AKIAT57BV3QSFDR5XZ5U"
    secret_key = "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"
  }

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
  region  = "us-east-1"
  access_key = "AKIAT57BV3QSFDR5XZ5U"
  secret_key = "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"
}

########
#VPC
#########
resource "aws_vpc" "vpc_1" {
    cidr_block                       = var.vpc_cidr_block
    instance_tenancy                 = var.instance_tenancy
    enable_dns_hostnames             = var.enable_dns_hostnames
    enable_dns_support               = var.enable_dns_support
        
    tags = {
        Name = "My VPC1-sree"
    }
}


resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "${var.vpc_public_subnet_1}"
  availability_zone ="us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet-1"
  }
}

resource "aws_subnet" "public-2" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "${var.vpc_public_subnet_2}"
  availability_zone ="us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet-2"
  }
}

resource "aws_subnet" "public-3" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "${var.vpc_public_subnet_3}"
  availability_zone ="us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "public subnet-3"
  }
}


resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "${var.vpc_private_subnet_1}"
  availability_zone ="us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-1"
  }
}

resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "${var.vpc_private_subnet_2}"
  availability_zone ="us-east-1b"
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-2"
  }
}

resource "aws_subnet" "private-3" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "${var.vpc_private_subnet_3}"
  availability_zone ="us-east-1c"
  map_public_ip_on_launch = false 

  tags = {
    Name = "private-subnet-3"
  }
}
