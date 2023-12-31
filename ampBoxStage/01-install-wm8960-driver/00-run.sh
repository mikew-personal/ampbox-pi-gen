#!/bin/bash -e

mkdir -p "${ROOTFS_DIR}/tmp/WM8960-driver"

install -m 755 -d "${ROOTFS_DIR}/tmp/WM8960-driver"
install -m 644 files/WM8960-Audio-HAT/* "${ROOTFS_DIR}/tmp/WM8960-driver"

on_chroot << EOF
    if [ ! -d /tmp/WM8960-driver ]; then
        echo "WM890 driver code did not copy"
        return -1
    fi

    cd /tmp/WM8960-driver
    chmod +x install.sh
    ./install.sh

#if ! id -u ${FIRST_USER_NAME} >/dev/null 2>&1; then
#	adduser --disabled-password --gecos "" ${FIRST_USER_NAME}
#fi

#if [ -n "${FIRST_USER_PASS}" ]; then
#	echo "${FIRST_USER_NAME}:${FIRST_USER_PASS}" | chpasswd
#fi
#echo "root:root" | chpasswd
EOF

