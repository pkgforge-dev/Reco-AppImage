#!/bin/sh

set -eu

ARCH=$(uname -m)

pacman -Syu --noconfirm vala pipewire-audio gst-libav gst-plugins-good gst-plugins-base

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
make-aur-package live-chart
make-aur-package ryokucha
make-aur-package reco
