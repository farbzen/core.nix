hl.window_rule({
  match = { float = true, focus = true },
  opacity = "0.9",
})
hl.window_rule({
  border_size = 0,
  match = { class = "^(org.gnome.)" },
  rounding = 12,
})
hl.window_rule({
  border_size = 0,
  match = { class = "^(org.wezfurlong.wezterm|Alacritty|zen|com.mitchellh.ghostty|kitty|foot)$" },
})
hl.window_rule({
  float = true,
  match = {
    class = "^(gnome-calculator|blueman-manager|org.quickshell|com.danklinux.dms)$",
  },
})
hl.window_rule({
  center = true,
  float = true,
  match = {
    class = "^(com.saivert.pwvucontrol|nm-connection-editor|qalculate-gtk|thunderbird|Oklch Color Picker)$",
  },
})
hl.window_rule({
  center = true,
  keep_aspect_ratio = true,
  float = true,
  match = {
    title = "^(nix_search_tv|nixos_advanced_rebuild_flake)$",
  },
  size = "1600 900",
})
hl.window_rule({
  float = false,
  match = { class = "^thunderbird$", initial_title = "^Mozilla(-| )Thunderbird$" },
})
hl.window_rule({
  float = true,
  keep_aspect_ratio = true,
  match = { title = "Picture(-| )in(-| )[Pp]icture" },
  move = "(monitor_w-window_w-20) (monitor_h-window_h-20)",
  pin = true,
  size = "267 150",
})
hl.window_rule({
  float = true,
  keep_aspect_ratio = true,
  match = { class = "^mpv$" },
  move = "(monitor_w-window_w-20) (monitor_h-window_h-20)",
  pin = true,
  size = "267 150",
})
hl.window_rule({
  match = { class = "^[Ss]team.*$" },
  suppress_event = "maximize fullscreen fullscreenoutput",
})
