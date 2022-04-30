module "hcp" {
  source        = "./modules/hcp"
  client_id     = var.hcp_client_id
  client_secret = var.hcp_client_secret
  create_hvn    = true
  hvn_cidr     = "10.20.1.0/25"

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