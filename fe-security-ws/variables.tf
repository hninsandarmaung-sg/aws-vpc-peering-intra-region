variable "region" {
  description = "The region where the resources are created."
  default     = "ap-southeast-1"
}

variable "frontend_prefix" {
  description = "The prefix for the frontend resources."
  default     = "frontend"
}

variable "frontend_environment" {
  description = "The environment for the frontend resources."
  default     = "dev"
}

variable "fe_network_workspace_name" {
  description = "Name of the network workspace to query."
  type        = string
  default     = "fe-network-ws"
}

variable "organization_name" {
  description = "Name of the HCP Terraform organization with the source workspace"
  type        = string
  default     = "hc-team"
}

variable "frontend_public_subnet_cidr" {
  description = "The CIDR block for the frontend public subnets."
  type        = string
  # default     = "27.130.180.215/32"
  default = "0.0.0.0/0"
}

# variable "be_security_workspace_name" {
#   description = "Name of the backend security workspace to query."
#   type        = string
#   default     = "be-security-ws"
# }