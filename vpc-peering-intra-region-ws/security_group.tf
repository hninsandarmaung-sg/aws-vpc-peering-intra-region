##### from frontend private security group 02 to backend private security group 02 to allow SSH and ICMP traffic in both directions 

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg02_allow_ssh_from_be_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg02_allow_icmp_from_be_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg02_allow_ssh_to_be_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg02_allow_icmp_to_be_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

###### from backend private security group 03 to frontend private security group 03 to allow SSH and ICMP traffic in both directions
resource "aws_vpc_security_group_ingress_rule" "fe_private_sg03_allow_ssh_from_be_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "fe_private_sg03_allow_icmp_from_be_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg03_allow_ssh_to_be_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg03_allow_icmp_to_be_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

###### from backend private security group 02 to frontend private security group 02 to allow SSH and ICMP traffic in both directions

resource "aws_vpc_security_group_ingress_rule" "be_private_sg02_allow_ssh_from_fe_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg02_allow_icmp_from_be_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg02_allow_ssh_to_fe_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg02_allow_icmp_to_fe_private_sg02" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg02_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg02_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

###### from backend private security group 03 to frontend private security group 03 to allow SSH and ICMP traffic in both directions    
resource "aws_vpc_security_group_ingress_rule" "be_private_sg03_allow_ssh_from_fe_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_ingress_rule" "be_private_sg03_allow_icmp_from_be_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg03_allow_ssh_to_fe_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  from_port                    = 22
  ip_protocol                  = "tcp"
  to_port                      = 22
}

resource "aws_vpc_security_group_egress_rule" "be_private_sg03_allow_icmp_to_fe_private_sg03" {
  depends_on = [aws_vpc_peering_connection.fevpc_peering_bevpc]

  security_group_id            = data.tfe_outputs.be_security_source_workspace.nonsensitive_values.backend_private_sg03_id
  referenced_security_group_id = data.tfe_outputs.fe_security_source_workspace.nonsensitive_values.frontend_private_sg03_id
  from_port                    = 8
  ip_protocol                  = "icmp"
  to_port                      = 0
}
