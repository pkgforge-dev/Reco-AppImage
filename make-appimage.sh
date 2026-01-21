#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q reco | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=https://raw.githubusercontent.com/ryonakano/reco/refs/heads/main/data/icons/128/com.github.ryonakano.reco.svg
export DESKTOP=/usr/share/applications/com.github.ryonakano.reco.desktop
export STARTUPWMCLASS=com.github.ryonakano.reco
export DEPLOY_GSTREAMER=1

# Deploy dependencies
quick-sharun /usr/bin/reco

# Turn AppDir into AppImage
quick-sharun --make-appimage
