hl.on("hyprland.start", function()
  hl.exec_cmd("kdeconnectd")
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd(
    "dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target"
  )
  hl.exec_cmd("~/.config/scripts/download_nixpkgs_cache_index.sh")
end)
