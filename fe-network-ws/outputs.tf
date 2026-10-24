output "frontend_vpc_id" {
  description = "VPC ID of the frontend VPC"
  value       = aws_vpc.frontend_vpc.id
}

output "frontend_public_subnet01_id" {
  description = "ID of the frontend public subnet"
  value       = aws_subnet.frontend_public_subnet01.id
}

output "frontend_private_subnet01_id" {
  description = "ID of the frontend private subnet"
  value       = aws_subnet.frontend_private_subnet01.id
}

output "frontend_private_subnet02_id" {
  description = "ID of the frontend private subnet"
  value       = aws_subnet.frontend_private_subnet02.id
}

output "frontend_private_subnet03_id" {
  description = "ID of the frontend private subnet"
  value       = aws_subnet.frontend_private_subnet03.id
}

output "frontend_public_subnet_cidr" {
  description = "IPv4 CIDR blocks of the frontend public subnets"

  value = [
    aws_subnet.frontend_public_subnet01.cidr_block,
    aws_subnet.frontend_public_subnet02.cidr_block,
    aws_subnet.frontend_public_subnet03.cidr_block,
  ]
}

output "frontend_private_subnet_cidr" {
  description = "IPv4 CIDR blocks of the frontend private subnets"

  value = [
    aws_subnet.frontend_private_subnet01.cidr_block,
    aws_subnet.frontend_private_subnet02.cidr_block,
    aws_subnet.frontend_private_subnet03.cidr_block,
  ]
}

# output "fevpc_peering_connection_id" {
#   description = "VPC Peering Connection ID between frontend and backend VPCs"
#   value       = aws_vpc_peering_connection.fevpc_peering_bevpc.id
# }

output "frontend_private_rtb02_id" {
  description = "ID of the frontend private route table 02"
  value       = aws_route_table.frontend_private_rtb02.id
}

output "frontend_private_rtb03_id" {
  description = "ID of the frontend private route table 03"
  value       = aws_route_table.frontend_private_rtb03.id
}