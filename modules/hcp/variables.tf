

variable "client_id" {
    type = string
    description = ""
}
variable "client_secret" {
    type = string
    description = ""
}

variable "create_hvn" {
  description = "Controls if HCP HVN should be created"
  type        = bool
  default     = true
}

variable "hvn_count" {
  description = "Controls if HCP HVN should be created"
  type        = string
}

variable "hvn_cloud_provider" {
    type = string
    description = "The provider where the HVN is located."
    default = "aws"
}

variable "hvn_region" {
  type        = string
  description = "The AWS region to provision the HashiCorp Virtual Network (HVN)."
  default = "us-east-1"
}

variable "hvn_cidr" {
    type = string
    description = "The CIDR range of the HVN"
}

variable "consul_cluster" {
  description = "Controls if HCP Consul Cluster should be created, as well as options."
  type = object({
    enabled = bool
    tier = string
    size = string
  })
  validation {
    condition = (
      (var.consul_cluster.enabled == true && 
        (var.consul_cluster.tier == "development" && var.consul_cluster.size == "x_small") ||
          (
            (contains(["standard", "plus"], var.consul_cluster.tier)) &&
            (contains(["small", "medium", "large"], var.consul_cluster.size))
          )
      ) ||
      (var.consul_cluster.enabled == false)
    )
    error_message = "Reason: Variable consul.enabled must be 'true' with valid values for 'tier' and 'size',\n        or consul.enabled must be 'false' with any/no values for 'tier' and 'size'.\n\nTier/size values must be valid: see https://cloud.hashicorp.com/products/consul/pricing for more detail."
  }
}

variable "consul_public_endpoint" {
  description = "Controls if HCP Consul Cluster endpoint is enabled. Has no effect if 'consul_cluster' is set to enabled=false. Defaults to false."
  type        = bool
  default     = false
}

variable "vault_cluster" {
  description = "Controls if HCP Vault Cluster should be created, as well as options."
  type = object({
    enabled = bool
    tier = string
  })
  validation {
    condition = (
      (var.vault_cluster.enabled == true && 
        (contains(["dev", "starter_small", "standard_small", "standard_medium", "standard_large", "plus_small", "plus_medium", "plus_large"], var.vault_cluster.tier))
      ) ||
      (var.vault_cluster.enabled == false)
    )
    error_message = "Reason: Variable vault.enabled must be 'true' with valid values for 'tier',\n        or vault.enabled must be 'false' with any/no values for 'tier'.\n\nTier values must be valid: see https://cloud.hashicorp.com/products/vault/pricing for more detail."
  }
}

variable "vault_public_endpoint" {
  description = "Controls if HCP Vault Cluster endpoint is enabled. Has no effect if 'vault_cluster' is set to enabled=false. Defaults to false."
  type        = bool
  default     = false
}