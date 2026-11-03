-- DMS Window Rules — managed by Dux Shell
-- Do not edit manually; changes may be overwritten

-- DMS-RULE: id=dms-floating-windows, name=DMS Floating Windows
hl.window_rule({ match = { class = "^(dev\\.duxlabs\\.shell|com\\.danklinux\\.dms)$" }, float = true })

-- DMS-RULE: id=dms_rule_2, name=Borderless Terminal
hl.window_rule({ match = { class = "^(org.wezfurlong.wezterm|Alacritty|zen|com.mitchellh.ghostty|kitty|foot)$" }, border_size = 0 })

-- DMS-RULE: id=dms_rule_3, name=Floating Config
hl.window_rule({ match = { class = "^(com.saivert.pwvucontrol|nm-connection-editor)$" }, float = true })

-- DMS-RULE: id=dms_rule_5, name=Floating Nix Search
hl.window_rule({ match = { title = "^(nix_search_tv)$" }, float = true, size = { 1600, 900 } })

-- DMS-RULE: id=dms_rule_6, name=Picture in Picture
hl.window_rule({ match = { title = "Picture(-| )in(-| )[Pp]icture" }, float = true, pin = true, size = { 267, 150 }, move = { "(monitor_w-window_w-20)", "(monitor_y-window_h-20)" } })

-- DMS-RULE: id=dms_rule_7, name=Steam
hl.window_rule({ match = { class = "^[Ss]team.*$" }, suppress_event = "maximize fullscreen fullscreenoutput" })

-- DMS-RULE: id=dms-window-opaque, name=DMS Window Opaque
hl.window_rule({ match = { class = "^(dev\\.duxlabs\\.shell|com\\.danklinux\\.dms)$" }, opaque = true })
