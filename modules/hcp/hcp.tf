
locals {
  create_hvn = var.create_hvn
  consul = var.consul_cluster

  vault = var.vault_cluster
}

resource "random_pet" "suffix" {
  length = 1
}

resource "hcp_hvn" "main-hvn" {
  count = local.create_hvn ? 1 : 0
  hvn_id = "hvn-${random_pet.suffix.id}"
  cloud_provider = var.hvn_cloud_provider
  region         = var.hvn_region
  cidr_block     = var.hvn_cidr
}

resource "hcp_consul_cluster" "cc1" {
count = local.consul.enabled ? 1 : 0
  cluster_id = "consul-${random_pet.suffix.id}"
  hvn_id     = hcp_hvn.main-hvn.*.hvn_id[count.index]
  tier       = local.consul.tier
  size = local.consul.size
  public_endpoint = var.consul_public_endpoint
}

resource "hcp_vault_cluster" "cc1" {
  count = local.vault.enabled ? 1 : 0
  cluster_id = "vault-${random_pet.suffix.id}"
  hvn_id     = hcp_hvn.main-hvn.*.hvn_id[count.index]
  tier       = local.vault.tier
  public_endpoint = var.vault_public_endpoint
  timeouts {
    default = "45m"
  }
}
