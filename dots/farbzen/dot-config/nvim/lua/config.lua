vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = "unnamedplus"
vim.opt.exrc = true
vim.opt.mousemoveevent = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.cursorlineopt = "number"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.inccommand = "split"

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

vim.cmd("let g:omni_sql_no_default_maps = 1")

if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font,Noto Color Emoji:h13"
  vim.opt.linespace = 5

  vim.g.neovide_padding_top = 16
  vim.g.neovide_padding_right = 16
  vim.g.neovide_padding_bottom = 16
  vim.g.neovide_padding_left = 16

  vim.g.neovide_floating_corner_radius = 0.5
  vim.g.neovide_opacity = 0.95
  vim.g.neovide_normal_opacity = 0.8

  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_scroll_animation_length = 0.2

  vim.g.neovide_underline_stroke_scale = 2

  local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
  end

  vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.2)
  end, { desc = "Zoom in" })
  vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.2)
  end, { desc = "Zoom out" })
end
