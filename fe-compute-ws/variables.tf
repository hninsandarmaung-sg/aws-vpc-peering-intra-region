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

variable "fe_instance_type" {
  description = "Specifies the AWS instance type."
  default     = "t3.micro"
}

#############################################################
# App Variables
#############################################################

variable "fe_placeholder" {
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
variable "fe_network_workspace_name" {
  description = "Name of the frontend network workspace to query."
  type        = string
  default     = "fe-network-ws"
}

variable "fe_security_workspace_name" {
  description = "Name of the frontend security workspace to query."
  type        = string
  default     = "fe-security-ws"
}

variable "organization_name" {
  description = "Name of the HCP Terraform organization with the source workspace"
  type        = string
  default     = "hc-team"
}