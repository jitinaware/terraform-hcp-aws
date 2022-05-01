

variable "hcp_create_hvn" {
  description = "Controls if HCP HVN should be created"
  type        = bool
  default     = true
}

variable "hcp_client_id" {
  type        = string
  description = ""
}


variable "hcp_client_secret" {
  type        = string
  description = ""
}

variable "hcp_hvn_aws_region" {
  type        = string
  description = "The AWS region to provision the HashiCorp Virtual Network (HVN)"
  default     = "us-east-1"
  validation {
    condition     = contains(["us-east-1", "us-west-2", "eu-west-1", "eu-west-2", "eu-central-1", "ap-southeast-1", "ap-southeast-2"], var.hcp_hvn_aws_region)
    error_message = "Valid values for the hvn region are:\n\n   AMER: us-east-1, us-west-2 \n   EUR:  eu-west-1, eu-west-2, eu-central-1\n   APAC: ap-southeast-1, ap-southeast-2."
  }
}

variable "hcp_hvn_cidr" {
  type        = string
  description = "The CIDR range of the HVN"
  default     = ""
}