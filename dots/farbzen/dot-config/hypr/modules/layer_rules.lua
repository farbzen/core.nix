hl.layer_rule({ match = { namespace = "dms" }, no_anim = true })
hl.layer_rule({ animation = "slide right", match = { namespace = "dms:control-center" } })
hl.layer_rule({ animation = "slide top", match = { namespace = "dms:workspace-overview" } })
hl.layer_rule({
  blur = true,
  ignore_alpha = 0,
  match = {
    namespace = "(dms:(bar|color-picker|clipboard|dash:background|spotlight|settings|notification-popup)|launcher)",
  },
})
hl.layer_rule({
  no_screen_share = true,
  match = {
    namespace = "(dms:dankisland:dismiss)",
  },
})
