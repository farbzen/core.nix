return {
  "mini.map",
  auto_enable = true,
  after = function()
    local minimap = require("mini.map")
    minimap.setup({
      integrations = {
        minimap.gen_integration.builtin_search(),
        minimap.gen_integration.diagnostic(),
        minimap.gen_integration.gitsigns(),
      },
      window = { winblend = 0 },
    })

    vim.keymap.set("n", "<leader>mm", minimap.toggle, { desc = "Toggle minimap" })
  end,
}
