return {
  "neo-tree.nvim",
  after = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
      filesystem = {
        filtered_items = {
          visible = true,
        },
        follow_current_file = {
          enabled = true,
        },
        close_if_last_window = true,
        window = {
          position = "float",
          mappings = {
            ["l"] = "open",
            ["h"] = "close_node",
          },
        },
      },
    })

    vim.keymap.set("n", "<C-o>", function()
      vim.cmd("Neotree")
    end, { desc = "Open file explorer" })
  end,
}
