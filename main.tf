terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.14.3"
    }
  }
}

provider "linode" {
    token = var.LINODE_TOKEN
}
