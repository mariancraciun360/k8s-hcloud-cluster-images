source "hcloud" "talos-x64-snapshot" {
  image       = "ubuntu-24.04"
  rescue      = "linux64"
  location    = var.server_location
  server_type = "cx23"
  snapshot_labels = {
    arch               = "amd64"
    os                 = "talos"
    talos_version      = var.talos_version
    creator            = "packer"
    type               = "infra"
    talos_schematic_id = substr(var.talos_schematic_id, 0, 24)
  }
  snapshot_name = "talos-amd64-${var.talos_version}"
  ssh_username  = "root"
}

source "hcloud" "talos-arm64-snapshot" {
  image       = "ubuntu-24.04"
  rescue      = "linux64"
  location    = var.server_location
  server_type = "cax11"
  snapshot_labels = {
    arch               = "arm64"
    os                 = "talos"
    talos_version      = var.talos_version
    creator            = "packer"
    type               = "infra"
    talos_schematic_id = substr(var.talos_schematic_id, 0, 24)
  }
  snapshot_name = "talos-arm64-${var.talos_version}"
  ssh_username  = "root"
}
