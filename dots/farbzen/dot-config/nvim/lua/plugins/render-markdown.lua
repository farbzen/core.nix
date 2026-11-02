return {
  "render-markdown.nvim",
  auto_enable = true,
  after = function()
    require("render-markdown").setup({ enabled = false })

    vim.keymap.set("n", "<leader>mp", function()
      vim.cmd("RenderMarkdown preview")
    end, { desc = "Open markdown preview" })
    vim.keymap.set("n", "<leader>mt", function()
      vim.cmd("RenderMarkdown toggle")
    end, { desc = "Toggle markdown rendering" })
  end,
}
