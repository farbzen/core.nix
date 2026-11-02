return {
  "autoclose.nvim",
  auto_enable = true,
  lazy = false,
  after = function()
    require("autoclose").setup({ options = { disable_when_touch = true } })
  end,
}
