terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.9.0"
    }


    random = {
      source  = "hashicorp/random"
      version = "3.1.3"
    }
  }
}

provider "random" {
  # Configuration options
}


