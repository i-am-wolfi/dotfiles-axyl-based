#!/bin/bash
# instala configs preservando estrutura ~/.config + fontes
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p ~/.local/share/fonts ~/.config
cp -a "$DIR/.config/." ~/.config/
cp -a "$DIR/fonts/." ~/.local/share/fonts/
fc-cache -fv ~/.local/share/fonts
chmod +x ~/.config/i3/bin/speedup ~/.config/i3/bin/speeddown ~/.config/i3/bin/theme-switch.sh
command -v dunst >/dev/null || echo "Falta dunst: sudo pacman -S dunst"
echo "OK. Relogue no i3."
