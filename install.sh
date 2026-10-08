#!/bin/bash
# instala configs preservando estrutura ~/.config + fontes
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.local/share/fonts ~/.config
cp -a "$DIR/.config/." ~/.config/
cp -a "$DIR/fonts/." ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts
chmod +x ~/.config/i3/bin/speedup ~/.config/i3/bin/speeddown ~/.config/i3/bin/temp ~/.config/i3/bin/theme-switch.sh ~/.config/i3/bin/materialyou-set ~/.config/i3/bin/wallpaper-picker
command -v dunst >/dev/null || echo "Falta dunst: sudo pacman -S dunst"
command -v matugen >/dev/null || echo "Para o tema MaterialYou (dinâmico): sudo pacman -S matugen"
command -v ffmpeg >/dev/null || echo "Para thumbs webp no picker: sudo pacman -S ffmpeg"
command -v rofi >/dev/null || echo "Para o picker de wallpaper ($MOD+W): sudo pacman -S rofi"
echo "OK. Relogue no i3."
