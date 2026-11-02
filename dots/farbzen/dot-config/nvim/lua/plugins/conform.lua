return {
  "conform.nvim",
  auto_enable = true,
  keys = { { "<leader>lf", desc = "Format current file" } },
  after = function()
    require("conform").setup({
      formatters_by_ft = {
        python = { "isort", "ruff_format" },
        rust = { "rustfmt" },
        go = { "gofmt", "golines" },
        lua = { "stylua" },
        nix = { "alejandra" },
        bash = { "shfmt" },
        sh = { "shfmt" },
        javascript = { "deno_fmt" },
        typescript = { "deno_fmt" },
        json = { "deno_fmt" },
        html = { "prettierd" },
        svelte = { "prettierd" },
        htmldjango = { "prettierd" },
        css = { "prettierd" },
        markdown = { "deno_fmt" },
      },
    })

    vim.keymap.set("n", "<leader>lf", function()
      require("conform").format({ async = "true" })
    end, { desc = "Format current file" })
  end,
}
