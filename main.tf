module "hcp" {
  source        = "./modules/hcp"
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  create_hvn    = true
  hvn_cidr      = var.hcp_hvn_cidr

  hvn_count = 2
  consul_cluster = {
    enabled = "true"
    tier    = "development"
    size    = "x_small"
  }
  consul_public_endpoint = true

  vault_cluster = {
    enabled = "true"
    tier    = "dev"
  }
}