return {
  "bufferline.nvim",
  after = function()
    local color_base = "#191725"
    local bg_color_selected = "#1F1D2E"
    local fg_color_selected = "#FFFFFF"
    require("bufferline").setup({
      options = {
        always_show_bufferline = true,
        show_close_icon = false,
        separator_style = "slope",
        hover = {
          enabled = true,
          delay = 100,
          reveal = { "close" },
        },
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {
          {
            filetype = "neotest-summary",
            text = "Tests",
            text_align = "left",
            separator = true,
          },
        },
      },

      highlights = {
        fill = {
          bg = color_base,
          fg = color_base,
        },
        separator = {
          fg = color_base,
          bg = color_base,
        },
        separator_selected = {
          bg = bg_color_selected,
          fg = color_base,
        },
        separator_visible = { fg = color_base },
        tab_selected = { fg = fg_color_selected },
        tab_separator = { fg = color_base },
        tab_separator_selected = { fg = color_base },
        background = { bg = color_base },
        trunc_marker = { bg = color_base },
        buffer_selected = { bg = bg_color_selected },
        close_button = { bg = color_base },
        close_button_selected = { bg = bg_color_selected },
        modified = { bg = color_base },
        modified_selected = { bg = bg_color_selected },
        numbers = { bg = color_base },
        numbers_selected = { bg = bg_color_selected },
        hint = { bg = color_base },
        hint_selected = { bg = bg_color_selected },
        info = { bg = color_base },
        info_selected = { bg = bg_color_selected },
        warning = { bg = color_base },
        warning_selected = { bg = bg_color_selected },
        error = { bg = color_base },
        error_selected = { bg = bg_color_selected },
        diagnostic = { bg = color_base },
        diagnostic_selected = { bg = bg_color_selected },
        hint_diagnostic = { bg = color_base },
        hint_diagnostic_selected = { bg = bg_color_selected },
        info_diagnostic = { bg = color_base },
        info_diagnostic_selected = { bg = bg_color_selected },
        warning_diagnostic = { bg = color_base },
        warning_diagnostic_selected = { bg = bg_color_selected },
        error_diagnostic = { bg = color_base },
        error_diagnostic_selected = { bg = bg_color_selected },
        duplicate = { bg = color_base },
        duplicate_selected = { bg = bg_color_selected },
        indicator_selected = { bg = bg_color_selected },
        pick = { bg = color_base },
        pick_selected = { bg = bg_color_selected },
      },
    })

    vim.keymap.set("n", "<M-h>", function()
      vim.cmd("BufferLineCyclePrev")
    end, { desc = "Jump to previous buffer" })
    vim.keymap.set("n", "<M-l>", function()
      vim.cmd("BufferLineCycleNext")
    end, { desc = "Jump to next buffer" })
    vim.keymap.set("n", "<M-$>", function()
      vim.cmd("BufferLineGoToBuffer -1")
    end, { desc = "Jump to last buffer in bufferline" })
    vim.keymap.set("n", "<M-1>", function()
      vim.cmd("BufferLineGoToBuffer 1")
    end, { desc = "Jump to buffer 1 in bufferline" })
    vim.keymap.set("n", "<M-2>", function()
      vim.cmd("BufferLineGoToBuffer 2")
    end, { desc = "Jump to buffer 2 in bufferline" })
    vim.keymap.set("n", "<M-3>", function()
      vim.cmd("BufferLineGoToBuffer 3")
    end, { desc = "Jump to buffer 3 in bufferline" })
    vim.keymap.set("n", "<M-4>", function()
      vim.cmd("BufferLineGoToBuffer 4")
    end, { desc = "Jump to buffer 4 in bufferline" })
    vim.keymap.set("n", "<M-5>", function()
      vim.cmd("BufferLineGoToBuffer 5")
    end, { desc = "Jump to buffer 5 in bufferline" })
    vim.keymap.set("n", "<M-6>", function()
      vim.cmd("BufferLineGoToBuffer 6")
    end, { desc = "Jump to buffer 6 in bufferline" })
    vim.keymap.set("n", "<M-7>", function()
      vim.cmd("BufferLineGoToBuffer 7")
    end, { desc = "Jump to buffer 7 in bufferline" })
    vim.keymap.set("n", "<M-8>", function()
      vim.cmd("BufferLineGoToBuffer 8")
    end, { desc = "Jump to buffer 8 in bufferline" })
    vim.keymap.set("n", "<M-9>", function()
      vim.cmd("BufferLineGoToBuffer 9")
    end, { desc = "Jump to buffer 9 in bufferline" })
  end,
}
