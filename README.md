# hcloud k8s images (Talos Linux)

## Configure Credentials

Add to your .envrc

```bash
export HCLOUD_TOKEN="token"
```

## Build Talos images

This configuration builds Talos Linux snapshots for both AMD64 and ARM64 architectures using the Talos Image Factory.

### Suggested Schematic

To generate a `talos_schematic_id`, you can use the following schematic configuration (e.g. in `schematic.yaml`):

```yaml
customization:
    systemExtensions:
        officialExtensions:
            - siderolabs/iscsi-tools
            - siderolabs/util-linux-tools
```

### Variables

You need to provide the following variables. You can create a `talos.pkrvars.hcl` file:

```hcl
server_location    = "fsn1"
talos_version      = "v1.7.6"
talos_schematic_id = "376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba"
```

### Build

```bash
packer init images
packer build -var-file=talos.pkrvars.hcl images
```
