local transparency = not vim.g.neovide

return {
  "rose-pine.nvim",
  event = "VimEnter",
  colorscheme = { "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn" },
  after = function()
    require("rose-pine").setup({ styles = { transparency = transparency } })
    vim.cmd.colorscheme(nixInfo("rose-pine-main", "settings", "colorscheme"))
  end,
}
