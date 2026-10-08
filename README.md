# dotfiles i3 (base Axyl)

## Dependências
i3-wm, sxhkd, picom, alacritty, rofi, polybar, dunst, feh, JetBrainsMono Nerd Font (em fonts/)

Arch: `sudo pacman -S i3-wm sxhkd picom alacritty rofi polybar dunst feh`

Fontes em fonts/

Install: ./install.sh

Scripts netspeed auto-detectam interface via `ip -o link show up`, temp auto-detecta CPU (coretemp Package → x86_pkg_temp → thermal_zone) sem hwmon fixo, em ~/.config/i3/bin/

Temas em `.config/i3/themes/` — troca com `Super+T` ou `Mod+Shift+T` (rofi).
Dunst segue a paleta do polybar (borda azul-clara, texto branco, fundo escuro).
