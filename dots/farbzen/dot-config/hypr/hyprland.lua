local function want(module)
  local function requiref(mod)
    require(mod)
  end

  pcall(requiref, module)
end

require("modules.environment")
require("modules.config")
require("modules.animations")
require("modules.keybinds")
require("modules.layer_rules")
require("modules.window_rules")
require("modules.startup")

require("dms.colors")
require("dms.cursor")
require("dms.layout")
require("dms.windowrules")

want("outputs")
want("startup")
