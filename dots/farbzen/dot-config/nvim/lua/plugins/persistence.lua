return {
  "persistence.nvim",
  after = function()
    local p = require("persistence")

    p.setup({
      dir = vim.fn.stdpath("state") .. "/sessions/",
      need = 1,
      branch = true,
    })
    vim.keymap.set("n", "<leader>ql", p.load, { desc = "Load the last session" })
    vim.keymap.set("n", "<leader>qL", p.select, { desc = "Select a session to load" })
    vim.keymap.set("n", "<leader>qd", p.stop, { desc = "Disable persistence (no save on exit)" })
  end,
}
