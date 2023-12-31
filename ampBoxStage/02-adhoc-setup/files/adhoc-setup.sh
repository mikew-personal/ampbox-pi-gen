#!/bin/bash

INTERFACE="wlan0"

# Create the SSID name from the hostname and mac address
MAC_ADDRESS=$(cat /sys/class/net/$INTERFACE/address)"
UUID=${MAC_ADDRESS: -4}
HOSTNAME=$(hostname)
SSID="${HOSTNAME}-${UUID}"

# Bring down the interface
ip link set dev $INTERFACE down

iwconfig $INTERFACE mode ad-hoc
iwconfig $INTERFACE essid "$SSID"

ip addr add 192.168.4.1/24 dev $INTERFACE

ip link set dev $INTERFACE up

