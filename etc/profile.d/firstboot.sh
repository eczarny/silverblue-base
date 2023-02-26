if test "$(id -u)" -gt "0" && test -d "$HOME"; then
  if test ! -e "$HOME"/.config/firstboot-done; then
    mkdir -p "$HOME"/.config/autostart
    cp -f /etc/skel.d/.config/autostart/firstboot.desktop "$HOME"/.config/autostart
  fi
fi
