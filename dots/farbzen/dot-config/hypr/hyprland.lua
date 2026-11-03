local function want(module)
  local function requiref(mod)
    require(mod)
  end

  pcall(requiref, module)
end

hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.config({
  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
  },
})

hl.layer_rule({ match = { namespace = "dms" }, no_anim = true })
hl.layer_rule({ match = { namespace = "launcher" }, blur = true, ignore_alpha = 0 })

require("dms.colors")
-- require("dms.outputs")
require("dms.layout")
require("dms.cursor")
require("dms.input")
require("dms.binds")
require("dms.binds-user")
require("dms.windowrules")

want("outputs")
want("startup")
