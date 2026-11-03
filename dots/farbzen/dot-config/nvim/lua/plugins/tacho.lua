return {
  "tacho.nvim",
  lazy = false,
  after = function()
    require("tacho").setup({
      -- statusline_format = "{live_wpm} / {wpm}",
    })
  end,
}
