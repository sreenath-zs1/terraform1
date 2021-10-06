output "VPC_id" {
  description = "ID of the VPC"
  value       = aws_vpc.vpc_1.id
}

output "VPC_Name" {
  description = "ID of the VPC"
  value       = var.name
}