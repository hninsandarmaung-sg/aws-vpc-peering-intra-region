####### aws region variable
variable "region" {
  description = "The region where the resources are created."
  default     = "ap-southeast-1"
}


####### data reference to other workspaces in the same organization
variable "be_network_workspace_name" {
  description = "Name of the network workspace to query."
  type        = string
  default     = "be-network-ws"
}

variable "be_security_workspace_name" {
  description = "Name of the security workspace to query."
  type        = string
  default     = "be-security-ws"
}

variable "fe_network_workspace_name" {
  description = "Name of the network workspace to query."
  type        = string
  default     = "fe-network-ws"
}

variable "fe_security_workspace_name" {
  description = "Name of the security workspace to query."
  type        = string
  default     = "fe-security-ws"
}

variable "organization_name" {
  description = "Name of the HCP Terraform organization with the source workspace"
  type        = string
  default     = "hc-team"
}