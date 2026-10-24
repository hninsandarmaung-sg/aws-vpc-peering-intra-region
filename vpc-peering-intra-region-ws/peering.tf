resource "aws_vpc_peering_connection" "fevpc_peering_bevpc" {
  vpc_id      = data.tfe_outputs.fe_network_source_workspace.nonsensitive_values.frontend_vpc_id
  peer_vpc_id = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_vpc_id
  #   peer_vpc_id = aws_vpc.backend_vpc.id
  auto_accept = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }

  #   tags = {
  #     Side = "Requester"
  #   }
}

# From the frontend VPC to the backend VPC to allow traffic from the frontend private subnets to the backend private subnets
resource "aws_route" "fevpc_private_subnet02_to_bevpc_private_subnet02" {
  route_table_id         = data.tfe_outputs.fe_network_source_workspace.nonsensitive_values.frontend_private_rtb02_id
  destination_cidr_block = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_subnet_cidr[1]
  #   destination_cidr_block    = var.backend_private_subnet_cidr[1]
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

resource "aws_route" "fevpc_private_subnet03_to_bevpc_private_subnet03" {
  route_table_id         = data.tfe_outputs.fe_network_source_workspace.nonsensitive_values.frontend_private_rtb03_id
  destination_cidr_block = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_subnet_cidr[2]
  #   destination_cidr_block    = var.backend_private_subnet_cidr[2]
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
}

# From the backend VPC to the frontend VPC to allow traffic from the backend private subnets to the frontend private subnets
resource "aws_route" "bevpc_private_subnet02_to_fevpc_private_subnet02" {
  route_table_id            = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_rtb02_id
  destination_cidr_block    = data.tfe_outputs.fe_network_source_workspace.nonsensitive_values.frontend_private_subnet_cidr[1]
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
  # destination_cidr_block    = var.frontend_private_subnet_cidr[1]
}

resource "aws_route" "bevpc_private_subnet03_to_fevpc_private_subnet03" {
  route_table_id            = data.tfe_outputs.be_network_source_workspace.nonsensitive_values.backend_private_rtb03_id
  destination_cidr_block    = data.tfe_outputs.fe_network_source_workspace.nonsensitive_values.frontend_private_subnet_cidr[2]
  vpc_peering_connection_id = aws_vpc_peering_connection.fevpc_peering_bevpc.id
  # destination_cidr_block    = var.frontend_private_subnet_cidr[2]
}