return {
  {
    "neotest",
    auto_enable = true,
    after = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({ dap = { justMyCode = false } }),
          require("neotest-plenary"),
          require("neotest-rust"),
        },
        floating = {
          border = "rounded",
        },
      })

      vim.keymap.set(
        "n",
        "<leader>tr",
        require("neotest").run.run,
        { desc = "Run current test(s)" }
      )
      vim.keymap.set("n", "<leader>td", function()
        require("neotest").run.run({ strategy = "dap" })
      end, { desc = "Debug current test(s)" })
      vim.keymap.set(
        "n",
        "<leader>ta",
        require("neotest").run.attach,
        { desc = "Attach to current test(s)" }
      )
      vim.keymap.set(
        "n",
        "<leader>to",
        require("neotest").output_panel.toggle,
        { desc = "Toggle test output panel" }
      )
      vim.keymap.set(
        "n",
        "<leader>ts",
        require("neotest").summary.toggle,
        { desc = "Toggle test summary" }
      )
    end,
  },
  { "neotest-plenary", dep_of = { "neotest" } },
  { "neotest-python", dep_of = { "neotest" } },
  { "neotest-rust", dep_of = { "neotest" } },
  {
    "nvim-coverage",
    dep_of = { "neotest" },
    after = function()
      require("coverage").setup({ auto_reafter = true })

      vim.keymap.set("n", "<leader>tcs", function()
        vim.cmd("Coverage")
      end, { desc = "Show test coverage" })
      vim.keymap.set("n", "<leader>tcc", function()
        vim.cmd("CoverageClear")
      end, { desc = "Clear test coverage" })
      vim.keymap.set("n", "<leader>tcS", function()
        vim.cmd("CoverageSummary")
      end, { desc = "Show test coverage summary" })
    end,
  },
}
