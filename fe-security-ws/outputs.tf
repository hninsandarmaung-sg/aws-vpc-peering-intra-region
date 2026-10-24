output "frontend_public_sg01_id" {
  description = "ID of the frontend public security group"
  value       = aws_security_group.fe_public_sg01.id
}

output "frontend_private_sg01_id" {
  description = "ID of the frontend private security group 01"
  value       = aws_security_group.fe_private_sg01.id
}

output "frontend_private_sg02_id" {
  description = "ID of the frontend private security group 02"
  value       = aws_security_group.fe_private_sg02.id
}

output "frontend_private_sg03_id" {
  description = "ID of the frontend private security group 03"
  value       = aws_security_group.fe_private_sg03.id
}