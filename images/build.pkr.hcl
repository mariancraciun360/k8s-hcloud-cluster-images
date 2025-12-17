build {
  sources = [
    "source.hcloud.talos-x64-snapshot",
    "source.hcloud.talos-arm64-snapshot"
  ]

  provisioner "shell" {
    inline = [
      local.install_talos
    ]
  }
}
