variable "region" {
  description = "The region where the resources are created."
  default     = "ap-southeast-1"
}

#############################################################
# backend VPC Variables
#############################################################

# variable "backend_vpc_address_space" {
#   description = "The CIDR block for the backend VPC."
#   default     = "10.0.0.0/16"
# }

variable "backend_prefix" {
  description = "The prefix for the backend resources."
  default     = "backend"
}

variable "backend_environment" {
  description = "The environment for the backend resources."
  default     = "dev"
}

variable "be_instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t3.micro"
}

#############################################################
# App Variables
#############################################################

variable "be_placeholder" {
  default     = "placedog.net"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}

variable "placeholder_id" {
  default     = "2"
  description = "Image-as-a-service URL. Some other fun ones to try are fillmurray.com, placecage.com, placebeard.it, loremflickr.com, baconmockup.com, placeimg.com, placebear.com, placeskull.com, stevensegallery.com, placedog.net"
}

variable "width" {
  default     = "600"
  description = "Image width in pixels."
}

variable "height" {
  default     = "400"
  description = "Image height in pixels."
}

##############################################################
variable "be_network_workspace_name" {
  description = "Name of the backend network workspace to query."
  type        = string
  default     = "be-network-ws"
}

variable "be_security_workspace_name" {
  description = "Name of the backend security workspace to query."
  type        = string
  default     = "be-security-ws"
}

variable "organization_name" {
  description = "Name of the HCP Terraform organization with the source workspace"
  type        = string
  default     = "hc-team"
}