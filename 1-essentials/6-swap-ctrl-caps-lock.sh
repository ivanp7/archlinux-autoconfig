#!/bin/bash

SCRIPT_DIR=$(realpath `dirname $0`)
. $(realpath $SCRIPT_DIR/..)/functions.sh

####################################################################

print_message "#### Swapping Ctrl/CapsLock keys ####"

####################################################################

initialize

####################################################################

sudo dumpkeys | head -1 | sudo tee /etc/ctrl-caps-swap.map
cat $SCRIPT_DIR/aux/6/ctrl-caps-swap.map | sudo tee -a /etc/ctrl-caps-swap.map

sudo install -Dm 644 $SCRIPT_DIR/aux/6/ctrl-caps-swap.service /etc/systemd/system/
sudo systemctl enable ctrl-caps-swap.service
sudo systemctl start ctrl-caps-swap.service

install -Dm 644 $SCRIPT_DIR/aux/6/.Xmodmap ./
ln -sf $(realpath .Xmodmap) $HOME/

sudo install -Dm 755 $SCRIPT_DIR/aux/6/90-reset-ctrl-caps-swap.sh /usr/lib/systemd/system-sleep/

####################################################################

finish

