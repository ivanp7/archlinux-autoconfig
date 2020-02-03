#!/bin/sh

SCRIPT_DIR=$(realpath `dirname $0`)
. $(realpath $SCRIPT_DIR/..)/functions.sh

####################################################################

print_message "#### Installing long term support kernel ####"

####################################################################

check_root

####################################################################

install_official_packages linux-lts
uninstall_packages linux
mkinitcpio -P
grub-mkconfig -o /boot/grub/grub.cfg

####################################################################

finish
