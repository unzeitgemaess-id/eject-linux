#!/usr/bin/env bash
# Hapus eject-usb dan eject-sd dari ~/.local/bin
set -euo pipefail
rm -f "$HOME/.local/bin/eject-usb" "$HOME/.local/bin/eject-sd"
echo "eject-usb dan eject-sd sudah dihapus. Baris PATH di ~/.bashrc dibiarkan."
