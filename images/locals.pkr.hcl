locals {
  install_talos = <<-EOT
    set -euo pipefail
    set -x

    if [ ! -b /dev/sda ]; then
      echo "Expected /dev/sda block device not found."
      ls -la /dev || true
      exit 1
    fi

    ARCH=$(uname -m)
    if [ "$ARCH" = "x86_64" ]; then
      TALOS_ARCH="amd64"
    elif [ "$ARCH" = "aarch64" ]; then
      TALOS_ARCH="arm64"
    else
      echo "Unsupported architecture: $ARCH"
      exit 1
    fi

    IMAGE_URL="https://factory.talos.dev/image/${var.talos_schematic_id}/${var.talos_version}/hcloud-$TALOS_ARCH.raw.xz"

    echo "Downloading Talos image from $IMAGE_URL..."
    curl -fsSL --retry 5 --retry-delay 5 --retry-connrefused "$IMAGE_URL" \
      | xz -d \
      | dd of=/dev/sda bs=4M conv=fsync status=progress
    sync
    echo "Write complete. Syncing and waiting..."
    sleep 10
  EOT
}
