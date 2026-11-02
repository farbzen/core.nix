return {
  "codewindow.nvim",
  auto_enable = true,
  after = function()
    local codewindow = require("codewindow")
    codewindow.setup({ window_border = "rounded" })

    vim.keymap.set("n", "<leader>mm", function() codewindow.toggle_minimap() end, { desc = "Toggle codewindow minimap" })
  end,
}
