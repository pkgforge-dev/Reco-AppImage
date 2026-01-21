#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm vala pipewire-audio gst-libav gst-plugins-good gst-plugins-base
make-aur-package live-chart
make-aur-package ryokucha
make-aur-package reco
