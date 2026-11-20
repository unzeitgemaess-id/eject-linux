# eject-linux

Dua command untuk eject drive removable di Ubuntu/Linux Mint dengan dialog pilihan nama dan notifikasi yang hilang sendiri.

| Command | Fungsi |
|---|---|
| `eject-usb` | Eject flashdisk atau drive USB. Pilih dari daftar nama (label, vendor, model, ukuran). Satu drive langsung diproses. |
| `eject-sd` | Khusus SD card: slot bawaan laptop (`mmcblk*`) dan card reader USB. Flashdisk biasa tidak ikut terdaftar. |

Cara kerjanya: unmount semua partisi lewat `udisksctl`, lalu `power-off` supaya device benar-benar aman dicabut. Slot SD bawaan laptop biasanya tidak mendukung power-off, jadi cukup unmount yang berhasil. Notifikasi hasil hilang otomatis setelah 4 detik.

## Instalasi

```bash
git clone https://github.com/unzeitgemaess-id/eject-linux.git && cd eject-linux && ./install.sh
```

Installer memasang `udisks2`, `zenity`, dan `libnotify-bin` lewat apt, menyalin script ke `~/.local/bin`, dan menulis PATH permanen ke `~/.bashrc` (dan `~/.zshrc` bila ada). Buka terminal baru, lalu jalankan `eject-usb` atau `eject-sd`. Setelah `git pull`, jalankan `./install.sh` lagi untuk memperbarui.

Tanpa apt: `SKIP_APT=1 ./install.sh`.

## Catatan

- Sengaja tidak dinamai `eject` karena sudah ada command bawaan `eject` untuk CD/DVD.
- Card reader USB dikenali dari vendor/model yang mengandung kata card, reader, sd, atau mmc. Kalau card reader tidak terdeteksi, cek nama modelnya dengan `lsblk -d -o NAME,TRAN,VENDOR,MODEL,SIZE` lalu sesuaikan pola di `eject-sd`.

## Lisensi

MIT
