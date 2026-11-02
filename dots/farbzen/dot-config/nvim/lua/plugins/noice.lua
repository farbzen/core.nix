return {
  "noice.nvim",
  auto_enable = true,
  after = function()
    require("noice").setup({
      presets = {
        bottom_search = true,
        command_palette = true,
        lsp_doc_border = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    })
  end,
}
