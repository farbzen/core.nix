return {
  "gitsigns.nvim",
  auto_enable = true,
  after = function()
    require("gitsigns").setup({ current_line_blame = true })

    vim.keymap.set("n", "<leader>gb", function()
      vim.cmd("Gitsigns toggle_current_line_blame")
    end, { desc = "Toggle git blame on current line" })
    vim.keymap.set("n", "<leader>ghp", function()
      vim.cmd("Gitsigns preview_hunk")
    end, { desc = "Preview git hunk" })
    vim.keymap.set("n", "<leader>ghP", function()
      vim.cmd("Gitsigns preview_hunk_inline")
    end, { desc = "Preview git hunk inline" })
    vim.keymap.set("n", "<leader>ghs", function()
      vim.cmd("Gitsigns stage_hunk")
    end, { desc = "Stage git hunk" })
    vim.keymap.set("n", "<leader>ghr", function()
      vim.cmd("Gitsigns reset_hunk")
    end, { desc = "Reset git hunk" })
  end,
}
