output "backend_public_sg01_id" {
  description = "ID of the backend public security group"
  value       = aws_security_group.be_public_sg01.id
}

output "backend_private_sg01_id" {
  description = "ID of the backend private security group 01"
  value       = aws_security_group.be_private_sg01.id
}

output "backend_private_sg02_id" {
  description = "ID of the backend private security group 02"
  value       = aws_security_group.be_private_sg02.id
}

output "backend_private_sg03_id" {
  description = "ID of the backend private security group 03"
  value       = aws_security_group.be_private_sg03.id
}