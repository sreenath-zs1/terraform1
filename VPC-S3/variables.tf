variable "vpc_cidr_block" {
  description = "The CIDR block for the MY VPC1-sree"
  type        = string
  default     = "10.0.0.0/16"
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "My VPC1-sree"
}


variable "vpc_public_subnet_1" {
  description = "The CIDR block for the Public subnet 1"
  type        = string
  default     = "10.0.101.0/24"
}

variable "vpc_public_subnet_2" {
  description = "The CIDR block for the Public subnet 2"
  type        = string
  default     = "10.0.102.0/24"
}

variable "vpc_public_subnet_3" {
  description = "The CIDR block for the Public subnet 1"
  type        = string
  default     = "10.0.103.0/24"
}

variable "vpc_private_subnet_1" {
  description = "The CIDR block for the private subnet 1"
  type        = string
  default     = "10.0.1.0/24"
}


variable "vpc_private_subnet_2" {
  description = "The CIDR block for the private subnet 2"
  type        = string
  default     = "10.0.2.0/24"
}
variable "vpc_private_subnet_3" {
  description = "The CIDR block for the private subnet 3"
  type        = string
  default     = "10.0.3.0/24"
}



variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}
