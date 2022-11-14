# DragOS SiteStore

## Build

Copy `DragOS-SiteStore-STS-500-VM-2.1.0.ova` into the current directory and run `build.sh`.

Set `IMAGE_UPLOAD_PATH` environment variable to override destination registry path for uploaded containerDisk.

## Deploy

```bash
kubectl apply -f sigstore.yaml
```
