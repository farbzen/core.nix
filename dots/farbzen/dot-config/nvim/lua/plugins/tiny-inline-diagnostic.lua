return {
  "tiny-inline-diagnostic.nvim",
  after = function()
    require("tiny-inline-diagnostic").setup({
      disabled_ft = { "neo-tree" },
      options = {
        multilines = { enabled = true },
        add_messages = { display_count = true },
        show_source = { enabled = true },
        use_icons_from_diagnostic = true,
        overflow = { padding = 8 },
      },
    })

    vim.diagnostic.config({ virtual_text = false })
  end,
}
