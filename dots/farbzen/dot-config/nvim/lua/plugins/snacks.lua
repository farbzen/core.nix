return {
  {
    "snacks.nvim",
    auto_enable = true,
    after = function()
      require("snacks").setup({
        animate = { enabled = true },
        bigfile = { enabled = true },
        dim = { enabled = true },
        indent = { enabled = true },
        input = { enabled = true },
        lazygit = { enabled = true },
        notifier = { enabled = true },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scratch = {
          enabled = true,
          ft = "markdown",
        },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        words = { enabled = true },
      })

      vim.keymap.set("n", "<C-M-o>", function()
        Snacks.picker.projects()
      end, { desc = "List recent projects" })
      vim.keymap.set("n", "<leader>bo", function()
        Snacks.picker.buffers()
      end, { desc = "Show open buffers" })
      vim.keymap.set("n", "<leader>ff", function()
        Snacks.picker.files()
      end, { desc = "Find file" })
      vim.keymap.set("n", "<leader>fg", function()
        Snacks.picker.grep()
      end, { desc = "Find content in files" })
      vim.keymap.set({ "n", "x" }, "<leader>fw", function()
        Snacks.picker.grep_word()
      end, { desc = "Find current word or selection in files" })
      vim.keymap.set("n", "<leader>lu", function()
        Snacks.picker.undo()
      end, { desc = "Show undo history" })
      vim.keymap.set("n", "<leader>bw", function()
        Snacks.bufdelete.delete()
      end, { desc = "Close current buffer" })
      vim.keymap.set("n", "<leader>bc", function()
        Snacks.bufdelete.other()
      end, { desc = "Close all except the current buffer" })
      vim.keymap.set("n", "gd", function()
        Snacks.picker.lsp_definitions()
      end, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>lr", function()
        Snacks.picker.lsp_references()
      end, { desc = "Show LSP references" })
      vim.keymap.set("n", "<leader>ls", function()
        Snacks.picker.lsp_symbols()
      end, { desc = "Show LSP symbols" })
      vim.keymap.set("n", "<leader>lD", function()
        Snacks.picker.diagnostics()
      end, { desc = "Show diagnostics" })
      vim.keymap.set("n", "<leader>ld", function()
        Snacks.picker.diagnostics_buffer()
      end, { desc = "Show diagnostics for current buffer" })
      vim.keymap.set("n", "<leader>ll", function()
        Snacks.picker.loclist()
      end, { desc = "Show location list" })
      vim.keymap.set("n", "<leader>lq", function()
        Snacks.picker.qflist()
      end, { desc = "Show quickfix list" })
      vim.keymap.set("n", "<leader>lt", function()
        Snacks.picker.todo_comments()
      end, { desc = "Show TODO comments" })
      vim.keymap.set("n", "<leader>gg", function()
        Snacks.lazygit.open()
      end, { desc = "Open Lazygit" })
      vim.keymap.set("n", "<leader>tt", function()
        Snacks.terminal()
      end, { desc = "Toggle terminal" })
      vim.keymap.set("n", "<leader>ds", function()
        if Snacks.dim.enabled then
          Snacks.dim.disable()
        else
          Snacks.dim.enable()
        end
      end, { desc = "Dim code around the current block" })
      vim.keymap.set("n", "<leader>s", function()
        Snacks.scratch.open()
      end, { desc = "Open scratchpad" })
      vim.keymap.set("n", "<leader>S", function()
        Snacks.scratch.select()
      end, { desc = "Select scratchpad" })
      vim.keymap.set("n", "<leader>nh", function()
        Snacks.picker.notifications()
      end, { desc = "Show notification history" })
      vim.keymap.set("n", "<leader>na", "<cmd>NoiceAll<cr>", { desc = "Show snacks history" })
    end,
  },
  {
    "todo-comments.nvim",
    dep_of = { "snacks.nvim" },
    after = function()
      require("todo-comments").setup({})
    end,
  },
}
