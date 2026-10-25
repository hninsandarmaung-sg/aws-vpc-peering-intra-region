variable "region" {
  description = "The region where the resources are created."
  default     = "ap-southeast-1"
}

variable "backend_prefix" {
  description = "The prefix for the backend resources."
  default     = "backend"
}

variable "backend_environment" {
  description = "The environment for the backend resources."
  default     = "dev"
}

variable "be_network_workspace_name" {
  description = "Name of the network workspace to query."
  type        = string
  default     = "be-network-ws"
}

variable "organization_name" {
  description = "Name of the HCP Terraform organization with the source workspace"
  type        = string
  default     = "hsdm-vcs-org"
}

variable "backend_public_subnet_cidr" {
  description = "The CIDR block for the backend public subnets."
  type        = string
  # default     = "27.130.180.215/32"
  default = "0.0.0.0/0"
}

# variable "fe_security_workspace_name" {
#   description = "Name of the frontend security workspace to query."
#   type        = string
#   default     = "fe-security-ws"
# }
