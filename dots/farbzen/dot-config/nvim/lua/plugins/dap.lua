return {
  { "nvim-dap", auto_enable = true },
  { "nvim-dap-python", dep_of = { "nvim-dap" } },
  { "nvim-dap-lldb", dep_of = { "nvim-dap" } },
  { "nvim-dap-go", dep_of = { "nvim-dap" } },
  {
    "nvim-dap-ui",
    dep_of = { "nvim-dap" },
    after = function()
      require("dapui").setup({
        layouts = {
          {
            elements = {
              { id = "console", size = 0.7 },
              { id = "watches", size = 0.15 },
              { id = "breakpoints", size = 0.15 },
            },
            size = 8,
            position = "bottom",
          },
        },
      })
      vim.keymap.set("n", "<F4>", function()
        require("dap").close()
        require("dapui").close()
      end, { desc = "DAP: Close" })
      vim.keymap.set("n", "<F5>", require("dap").continue, { desc = "DAP: Start/Continue" })
      vim.keymap.set("n", "<F6>", require("dap").restart, { desc = "DAP: Restart" })
      vim.keymap.set("n", "<F10>", require("dap").step_over, { desc = "DAP: Step over" })
      vim.keymap.set("n", "<F11>", require("dap").step_into, { desc = "DAP: Step into" })
      vim.keymap.set("n", "<F12>", require("dap").step_out, { desc = "DAP: Step out" })
      vim.keymap.set(
        "n",
        "<leader>db",
        require("dap").toggle_breakpoint,
        { desc = "DAP: Toggle breakpoint" }
      )
      vim.keymap.set("n", "<leader>dr", require("dap").repl.open, { desc = "DAP: Open REPL" })
      vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "DAP: Open UI" })
    end,
  },
}
