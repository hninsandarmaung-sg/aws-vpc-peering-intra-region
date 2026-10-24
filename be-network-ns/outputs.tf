output "backend_vpc_id" {
  description = "VPC ID of the backend VPC"
  value       = aws_vpc.backend_vpc.id
}

output "backend_public_subnet01_id" {
  description = "ID of the backend public subnet"
  value       = aws_subnet.backend_public_subnet01.id
}

output "backend_private_subnet01_id" {
  description = "ID of the backend private subnet"
  value       = aws_subnet.backend_private_subnet01.id
}

output "backend_private_subnet02_id" {
  description = "ID of the backend private subnet"
  value       = aws_subnet.backend_private_subnet02.id
}

output "backend_private_subnet03_id" {
  description = "ID of the backend private subnet"
  value       = aws_subnet.backend_private_subnet03.id
}

output "backend_public_subnet_cidr" {
  description = "IPv4 CIDR blocks of the backend public subnets"

  value = [
    aws_subnet.backend_public_subnet01.cidr_block,
    aws_subnet.backend_public_subnet02.cidr_block,
    aws_subnet.backend_public_subnet03.cidr_block,
  ]
}

output "backend_private_subnet_cidr" {
  description = "IPv4 CIDR blocks of the backend private subnets"

  value = [
    aws_subnet.backend_private_subnet01.cidr_block,
    aws_subnet.backend_private_subnet02.cidr_block,
    aws_subnet.backend_private_subnet03.cidr_block,
  ]
}

output "backend_private_rtb02_id" {
  description = "ID of the backend private route table 02"
  value       = aws_route_table.backend_private_rtb02.id
}

output "backend_private_rtb03_id" {
  description = "ID of the backend private route table 03"
  value       = aws_route_table.backend_private_rtb03.id
}