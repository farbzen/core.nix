return {
  "nvim-lint",
  auto_enable = true,
  event = "FileType",
  after = function()
    require("lint").linters_by_ft = {
      nix = { "statix" },
      go = { "staticcheck" },
      python = { "ruff" },
      css = { "stylelint" },
      svelte = { "eslint" },
      typescript = { "eslint" },
      javascript = { "eslint" },
      bash = { "shellcheck" },
      sh = { "shellcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
