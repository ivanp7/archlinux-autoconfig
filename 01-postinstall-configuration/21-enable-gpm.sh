#!/bin/sh

ROOT_DIR="$(realpath "$(dirname "$0")")/.."
. "$ROOT_DIR/.functions.sh"

####################################################################

print_message "#### Enabling GPM service ####"

####################################################################

check_root

####################################################################

enable_service gpm

####################################################################

finish

