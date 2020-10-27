#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")/.."
. "$ROOT_DIR/functions.sh"

####################################################################

print_message "#### Installing wallpapers ####"

####################################################################

check_user

####################################################################

ln -sf "$(realpath wallpapers)" $HOME/

####################################################################

finish

