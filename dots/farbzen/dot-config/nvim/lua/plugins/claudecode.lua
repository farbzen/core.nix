return {
  "claudecode.nvim",
  after = function()
    local toggle_key = "<C-,>"
    require("claudecode").setup({
      terminal = {
        provider = "snacks",
        snacks_win_opts = {
          position = "float",
          width = 0.9,
          height = 0.9,
          border = "rounded",
          keys = {
            claude_hide = {
              toggle_key,
              function(self)
                self:hide()
              end,
              mode = "t",
              desc = "Hide",
            },
          },
        },
      },
    })
    vim.keymap.set("n", toggle_key, function()
      vim.cmd("ClaudeCodeFocus")
    end, { desc = "Toggle Claude Code" })
  end,
}
