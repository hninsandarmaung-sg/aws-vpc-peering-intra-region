terraform {
  required_version = "~>1.16.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
  }

  cloud {

    organization = "hsdm-vcs-org"

    workspaces {
      name = "fe-security-ws"
    }
  }
}
