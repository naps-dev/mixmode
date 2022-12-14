# Please note: this script is only useful when running things locally and it not used by any pipelines or other automated processes.

# Docker upload destination for containerDisk
IMAGE_UPLOAD_PATH="${IMAAGE_UPLOAD_PATH}" # "${IMAGE_UPLOAD_PATH:-10.1.25.34/voltron/mockingbird-sandbox:latest}"

LIBGUESTFS_BACKEND=direct \
  virt-v2v \
  -i ova MixMode-8.11-export-i-0966be276efb5b2f2.ova \
  -o local -of qcow2 -os "$PWD" -on mixmode-8.11

virt-customize \
  -a mixmode-8.11-sda \
  --run-command 'yum install -y cloud-init qemu-guest-agent' \
  --run-command 'cloud-init clean --logs --seed'  \
  --append-line '/etc/default/grub:GRUB_TERMINAL=serial' \
  --append-line '/etc/default/grub:GRUB_SERIAL_COMMAND="serial --speed=115200 --unit=0 --word=8 --parity=no --stop=1"' \
  --run-command 'grub2-mkconfig -o /boot/grub2/grub.cfg'

# Push Kubevirt containerDisk
# https://github.com/kubevirt/kubevirt/blob/main/docs/container-register-disks.md
#mkdir disk
#mv Mockingbird_Sandbox-sda disk/
#cat >Dockerfile <<EOF
#FROM scratch
#ADD disk/* /disk/
#EOF
#docker build -t "$IMAGE_UPLOAD_PATH" .
#docker push "$IMAGE_UPLOAD_PATH"
