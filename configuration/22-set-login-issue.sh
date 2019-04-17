#!/bin/sh

SCRIPT_DIR=$(realpath `dirname $0`)
. $(realpath $SCRIPT_DIR/..)/functions.sh

####################################################################

print_message "#### Set login issue ####"

####################################################################

check_user

####################################################################

sudo install -Dm 644 $(aux_dir)/issue /etc/
LOGO_HALFWIDTH=18
LOGO_HALFHEIGHT=10
sudo sed -i "s/<HORIZONTAL>/$(($(tput cols) / 2 - $LOGO_HALFWIDTH))/; s/<VERTICAL>/$(($(tput lines) / 2 - 5 - $LOGO_HALFHEIGHT))/" /etc/issue

####################################################################

finish
