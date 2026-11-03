return {
  "tacho.nvim",
  lazy = false,
  after = function()
    require("tacho").setup({
      idle_timeout_ms = 1000,
      statusline_format = "󰼭 {wpm}",
    })
  end,
}
