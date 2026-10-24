variable "organization" {
  description = "HCP Terraform organization containing the target workspaces."
  type        = string
  default     = "hc-team"
}

variable "workspace_names" {
  description = "Actual HCP workspace names, which may differ from local directory names."
  type = object({
    be_network  = string
    be_security = string
    be_compute  = string
    fe_network  = string
    fe_security = string
    fe_compute  = string
    peering     = string
  })

  default = {
    be_network  = "be-network-ws"
    be_security = "be-security-ws"
    be_compute  = "be-compute-ws"
    fe_network  = "fe-network-ws"
    fe_security = "fe-security-ws"
    fe_compute  = "fe-compute-ws"
    peering     = "vpc-peering-intra-region-ws"
  }
}
