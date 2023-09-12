#!/bin/bash
cd `dirname $0`

# After setting up vino server in remote computer, launch this script
cp ./to_etc_systemd_system/vino_launch.service /etc/systemd/system

# Enable the fan run max service and leave the others disabled.
systemctl enable vino_launch.service

# Reloading daemon
systemctl daemon-reload