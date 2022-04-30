terraform {
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = "0.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }
  }
}



provider "hcp" {
  client_id     = var.client_id
  client_secret = var.client_secret
}

