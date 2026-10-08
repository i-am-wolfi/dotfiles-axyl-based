# dotfiles i3 (base Axyl)

## Dependências
i3-wm, sxhkd, picom, alacritty, rofi, polybar, dunst, feh, JetBrainsMono Nerd Font (em fonts/)

Arch: `sudo pacman -S i3-wm sxhkd picom alacritty rofi polybar dunst feh matugen` (matugen só p/ tema MaterialYou)

Fontes em fonts/

Install: ./install.sh

Scripts netspeed auto-detectam interface via `ip -o link show up`, temp auto-detecta CPU (coretemp Package → x86_pkg_temp → thermal_zone) sem hwmon fixo, em ~/.config/i3/bin/

Temas em `.config/i3/themes/` — troca com `Super+T` ou `Mod+Shift+T` (rofi).
Dunst segue a paleta do polybar (borda azul-clara, texto branco, fundo escuro).

## MaterialYou (estilo Noctalia/Monet, dinâmico)
Tema `MaterialYou` baseado no `i3_blue`, com cores puxadas do wallpaper via matugen
(`.config/matugen/config.toml` + `templates/` → polybar, dunst, alacritty do i3, bordas do i3).
- Trocar pelo rofi (com preview): `$MOD+W` → `wallpaper-picker` (jpg/jpeg/png/webp;
  webp vira png via ffmpeg). É o fluxo oficial: trocar na mão (feh/cp) NÃO regenera as cores.
- Trocar pelo terminal: `~/.config/i3/bin/materialyou-set ~/Imagens/wallpaper.webp`
- Ativar o tema: `Super+T` → `MaterialYou`.
- `$MOD+W` era `layout stacking`: foi p/ `$MOD+Ctrl+W`.
- Alacritty no i3 abre com `~/.config/i3/alacritty/alacritty.toml` (vem da pasta do
  tema ativo via theme-switch; MaterialYou regenera via matugen).
  `~/.config/alacritty/` (Hyprland) fica intacto.
