#!/bin/bash -e

install -m 755 files/adhoc-setup.sh "${ROOTFS_DIR}/usr/local/sbin"
install -m 644 files/adhoc-network.service "${ROOTFS_DIR}/etc/systemd/system"
install -m 644 files/adhoc-dhcpd.service "${ROOTFS_DIR}/etc/systemd/system"

on_chroot << EOF
    systemctl enable adhoc-network.service
    systemctl enable adhoc-dhcpd.service
EOF

