terraform {
  required_version = "~>1.16.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.69.1"
    }
  }

  cloud {

    organization = "hc-team"

    workspaces {
      name = "be-network-ws"
    }
  }
}
