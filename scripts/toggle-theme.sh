#!/usr/bin/env sh
set -euo

if test "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'"; then
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
  cp "$HOME/.config/alacritty/dark.toml" "$HOME/.config/alacritty/theme.toml"
  cp "$HOME/.config/rofi/dark.rasi" "$HOME/.config/rofi/colors.rasi"
  cp "$HOME/.config/swaync/dark.css" "$HOME/.config/swaync/colors.css"
else
  gsettings set org.gnome.desktop.interface color-scheme prefer-light
  gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
  cp "$HOME/.config/alacritty/light.toml" "$HOME/.config/alacritty/theme.toml"
  cp "$HOME/.config/rofi/light.rasi" "$HOME/.config/rofi/colors.rasi"
  cp "$HOME/.config/swaync/light.css" "$HOME/.config/swaync/colors.css"
fi
# swaync only runs under sway; in GNOME this does nothing
swaync-client --reload-css >/dev/null 2>&1 || true

