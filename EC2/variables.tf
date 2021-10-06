variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Demo-terraform-instance"
}
variable "aws_region" {
  default = "us-east-1"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "ec2_ami" {
  default = "ami-0eb5f3f64b10d3e0e"
}

variable "ec2_count" {
  type = number
  default = "3"
}
