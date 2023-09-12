#!/bin/bash
cd `dirname $0`

# Copy to the respective directories
cp -d -r ./to_opt_dir/JetsonStartup /opt
cp ./to_etc_systemd_system/fan_run_auto.service /etc/systemd/system
cp ./to_etc_systemd_system/fan_run_max.service /etc/systemd/system
cp ./to_etc_systemd_system/fan_run_stop.service /etc/systemd/system

# Enable the fan run max service and leave the others disabled.
systemctl enable fan_run_max.service

# Reloading daemon
systemctl daemon-reload
