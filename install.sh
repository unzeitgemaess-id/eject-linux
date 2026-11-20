#!/usr/bin/env bash
#
# Installer eject-linux: pasang eject-usb dan eject-sd ke ~/.local/bin
# Pakai SKIP_APT=1 ./install.sh kalau tidak mau install dependensi via apt.
#
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"

echo "==> Memeriksa dependensi (udisks2, zenity, libnotify-bin)"
if [ "${SKIP_APT:-0}" != "1" ] && command -v apt >/dev/null 2>&1; then
    sudo apt install -y udisks2 zenity libnotify-bin
else
    echo "    Lewati apt. Pastikan udisksctl, zenity, dan notify-send sudah terpasang."
fi

echo "==> Memasang script ke $BIN_DIR"
mkdir -p "$BIN_DIR"
install -m 755 "$REPO_DIR/eject-usb" "$BIN_DIR/eject-usb"
install -m 755 "$REPO_DIR/eject-sd" "$BIN_DIR/eject-sd"

echo "==> Memastikan $BIN_DIR ada di PATH permanen"
for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
    [ -f "$rc" ] || continue
    if ! grep -q '\.local/bin' "$rc"; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$rc"
        echo "    Menambahkan PATH ke $rc"
    fi
done

echo
echo "Selesai. Buka terminal baru (atau jalankan: source ~/.bashrc), lalu coba:"
echo "    eject-usb   # pilih flashdisk"
echo "    eject-sd    # khusus SD card"
