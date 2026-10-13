# dotfiles i3 (base Axyl)

## Dependências
i3-wm, sxhkd, picom, alacritty, rofi, polybar, dunst, feh, JetBrainsMono Nerd Font (em fonts/)

Arch: `sudo pacman -S i3-wm sxhkd picom alacritty rofi polybar dunst feh matugen` (matugen só p/ tema MaterialYou)

Fontes em fonts/

Install: ./install.sh

Scripts netspeed auto-detectam interface via `ip -o link show up`, temp auto-detecta CPU (coretemp Package → x86_pkg_temp → thermal_zone) sem hwmon fixo, em ~/.config/i3/bin/

Temas em `.config/i3/themes/` — troca com `Super+T` ou `Mod+Shift+T` (rofi).
Dunst segue a paleta do polybar (borda azul-clara, texto branco, fundo escuro).

## Printscreen (PrtSc)
`Print` = tela cheia, `Shift+Print` = área (mira), `$MOD+Print` = janela ativa.
Script `~/.config/i3/bin/screenshot` (maim): salva em `~/Pictures/Screenshots`,
copia p/ clipboard (xclip) e avisa no dunst. Requer: `sudo pacman -S maim xclip xdotool`.
(O bloco antigo `takeshot` do sxhkdrc foi desativado — programa não existe; i3 assumiu o Print.)

## Wallpaper em vídeo (i3/X11)
`xwinwrap + mpv`: instale com `pikaur -S xwinwrap-git` (mpv já vem no extra).
`~/.config/i3/bin/video-wallpaper start [--gpu|--x11] <mp4|mkv|webm|gif>` —
padrão `--x11` (com picom o `--vo=gpu` deixa o fundo preto; `--gpu` opt-in),
mutado, loop, hwdec, `stop` mata player+filhos (sem órfãos).
O feh continua por baixo como fallback.
O picker (`$MOD+W`) já lista vídeos e gifs (thumb via ffmpeg); ao escolher um, o
`materialyou-set` extrai 1 frame do meio (vídeo) ou usa o 1º frame (gif) p/
`wallpaper.jpg` (cores + fallback).

## USB no dunst
Conectou/removeu qualquer USB → aviso no dunst (produto + fabricante).
Script `~/.config/i3/bin/usb-notify` (acha a sessão gráfica via loginctl e
manda notify como seu usuário; ignora a enxurrada do boot nos primeiros 90s).
Ativar (precisa sudo 1x): `~/.config/i3/bin/usb-notify --install`
Teste sem plugar nada: `~/.config/i3/bin/usb-notify --test`

## MaterialYou (estilo Noctalia/Monet, dinâmico)
Tema `MaterialYou` baseado no `i3_blue`, com cores puxadas do wallpaper via matugen
(`.config/matugen/config.toml` + `templates/` → polybar, dunst, alacritty do i3, bordas do i3).
- Trocar pelo rofi (com preview): `$MOD+W` → `wallpaper-picker` (jpg/jpeg/png/webp;
  webp vira png via ffmpeg). É o fluxo oficial: trocar na mão (feh/cp) NÃO regenera as cores.
- Trocar pelo terminal: `~/.config/i3/bin/materialyou-set ~/Imagens/wallpaper.webp`
- Ativar o tema: `Super+T` → `MaterialYou`.
- `$MOD+W` era `layout stacking`: foi p/ `$MOD+Ctrl+W`.
- Alacritty no i3 abre com `~/.config/i3/alacritty/alacritty.toml` (vem da pasta do
  tema ativo via theme-switch; MaterialYou regenera via matugen, com
  `opacity = 0.5` p/ o blur do picom fazer efeito).
  `~/.config/alacritty/` (Hyprland) fica intacto.
- Rofi no MaterialYou usa `~/.config/i3/rofi-theme.rasi` (gerado via matugen,
  redondo 24px + fonte JetBrainsMono); demais temas usam rounded-*-dark.
  Picom (upstream, sem corner-radius por janela): `Rofi` entrou no
  `blur-background-exclude` em todos os picom.conf — o blur quadrado vazava
  nas pontas redondas; sem blur no rofi o halo some (shadow do Rofi já era excluído).
