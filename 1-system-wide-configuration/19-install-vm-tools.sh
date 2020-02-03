#!/bin/sh

SCRIPT_DIR=$(realpath `dirname $0`)
. $(realpath $SCRIPT_DIR/..)/functions.sh

####################################################################

print_message "#### Installing Open VM Tools ####"

####################################################################

check_root

####################################################################

install_official_packages open-vm-tools
systemctl enable --now vmtoolsd.service vmware-vmblock-fuse.service

####################################################################

print_message "Adding kernel modules..."
MODULES="vmw_balloon vmw_pvscsi vmw_vmci vmwgfx vmxnet3 vsock vmw_vsock_vmci_transport"
sed -i "/^MODULES=/ s/(/($MODULES /" /etc/mkinitcpio.conf
mkinitcpio -P

####################################################################

print_message "Setting framebuffer resolution..."

# Mode 0x0342: 1152x864 (+4608), 24 bits
sed -i 's/^GRUB_GFXMODE=auto$/GRUB_GFXMODE=1152x864x24/' /etc/default/grub
sed -i 's/^GRUB_GFXPAYLOAD_LINUX=keep$/GRUB_GFXPAYLOAD_LINUX=1152x864/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

####################################################################

finish
