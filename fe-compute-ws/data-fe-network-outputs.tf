# In the example below, assume we have outputs defined in a my-org/my-workspace

data "tfe_outputs" "fe_network_source_workspace" {
  workspace    = var.fe_network_workspace_name
  organization = var.organization_name
}

data "tfe_outputs" "fe_security_source_workspace" {
  workspace    = var.fe_security_workspace_name
  organization = var.organization_name
}