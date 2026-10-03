#!/usr/bin/env bash
# Troca temas do i3: cada subpasta de ~/.config/i3/themes/ é um tema completo.
# Uso: theme-switch.sh [nome]  |  sem arg: menu rofi (ou lista no terminal)
set -euo pipefail
I3DIR="$HOME/.config/i3"
THEMESDIR="$I3DIR/themes"

list_themes() { find "$THEMESDIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort; }

pick_theme() {
    if [[ $# -ge 1 ]]; then echo "$1"; return; fi
    local themes; themes=$(list_themes)
    if command -v rofi >/dev/null && [[ -n "${DISPLAY:-}" ]]; then
        echo "$themes" | rofi -dmenu -p "Tema i3" -config "$I3DIR/config.rasi"
    else
        echo "Temas disponíveis:" >&2
        echo "$themes" | nl >&2
        read -rp "Nome do tema: " sel >&2
        echo "$sel"
    fi
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" || "${1:-}" == "-l" || "${1:-}" == "--list" ]]; then list_themes; exit 0; fi
THEME="${1:-$(pick_theme)}"
[ -z "${THEME:-}" ] && exit 1
SRC="$THEMESDIR/$THEME"
[[ -d "$SRC" ]] || { echo "Tema '$THEME' não existe em $THEMESDIR" >&2; list_themes >&2; exit 1; }

# espelha tema -> ~/.config/i3 (preserva subpastas polybar/, bin/, alacritty/)
# sem --delete de propósito: temas não têm todos os arquivos (theme-switch.sh,
# speedup/speeddown, logout-menu.sh); apagar o que falta quebraria os atalhos.
if command -v rsync >/dev/null; then
    rsync -a --exclude='themes/' "$SRC"/ "$I3DIR"/
else
    cp -a "$SRC"/. "$I3DIR"/
fi
# garante wallpapers com nome fixo que o fehbg espera
for w in wallpaper.jpg wallpaper.png wallpaper.jpeg; do
    [[ -f "$I3DIR/$w" ]] || true
done
# reaplica e recarrega
bash "$I3DIR/fehbg" 2>/dev/null || true
i3-msg restart >/dev/null
bash "$I3DIR/bin/autostart.sh" >/dev/null 2>&1 &
echo "Tema aplicado: $THEME"
