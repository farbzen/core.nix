hl.config({
  decoration = {
    active_opacity = 1.0,
    blur = {
      contrast = 1.1,
      enabled = true,
      ignore_opacity = true,
      new_optimizations = true,
      noise = 0.02,
      passes = 4,
      size = 10,
      vibrancy = 0.2,
      vibrancy_darkness = 0.3,
      xray = false,
    },
    inactive_opacity = 0.9,
    rounding = 12,
    shadow = {
      color = "rgba(00000070)",
      enabled = true,
      offset = { 0, 5 },
      range = 30,
      render_power = 5,
    },
  },
  dwindle = {
    preserve_split = true,
  },
  general = {
    border_size = 0,
    col = { active_border = "rgba(707070ff)", inactive_border = "rgba(d0d0d0ff)" },
    gaps_in = 5,
    gaps_out = 10,
    layout = "scrolling",
  },
  input = {
    follow_mouse = 1,
    kb_layout = "us",
    kb_model = "pc104",
    kb_options = "",
    kb_variant = "altgr-intl",
    mouse_refocus = false,
    numlock_by_default = true,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
  },
  misc = {
    disable_hyprland_logo = true,
  },
})
