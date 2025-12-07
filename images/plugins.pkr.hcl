packer {
  required_plugins {
    hcloud = {
      version = ">= v1.7.0"
      source  = "github.com/hetznercloud/hcloud"
    }
  }
}