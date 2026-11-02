return {
  {
    "nvim-lspconfig",
    auto_enable = true,
    lsp = function(plugin)
      vim.lsp.config(plugin.name, plugin.lsp or {})
      vim.lsp.enable(plugin.name)
    end,
    before = function(_)
      vim.lsp.config("*", {
        on_attach = function()
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
          vim.keymap.set(
            "n",
            "<C-k>",
            vim.lsp.buf.signature_help,
            { desc = "Signature Documentation" }
          )
        end,
      })

      vim.lsp.inlay_hint.enable(true)
      vim.keymap.set("n", "<leader>lR", function()
        vim.cmd("lsp restart")
      end, { desc = "Restart LSP" })
      vim.keymap.set("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle LSP inlay hints" })
    end,
  },
  {
    "lazydev.nvim",
    auto_enable = true,
    cmd = { "LazyDev" },
    ft = "lua",
    after = function(_)
      require("lazydev").setup({
        library = {
          {
            words = { "nixInfo%.lze" },
            path = nixInfo("lze", "plugins", "start", "lze") .. "/lua",
          },
          {
            words = { "nixInfo%.lze" },
            path = nixInfo("lzextras", "plugins", "start", "lzextras") .. "/lua",
          },
        },
      })
    end,
  },
  {
    "lua_ls",
    lsp = {
      settings = {
        Lua = {
          signatureHelp = { enabled = true },
          diagnostics = {
            globals = { "hl", "nixInfo", "vim" },
            disable = { "missing-fields" },
          },
        },
      },
    },
  },
  { "pyright", lsp = {} },
  { "gopls", lsp = {} },
  { "svelte", lsp = {} },
  { "html", lsp = {} },
  { "sqls", lsp = {} },
  { "tailwindcss", lsp = {} },
  { "jsonls", lsp = {} },
  { "yamlls", lsp = {} },
  { "dockerls", lsp = {} },
  { "bashls", lsp = {} },
  { "nil_ls", lsp = {} },
  {
    "rustaceanvim",
    ft = "rust",
    after = function()
      vim.lsp.inlay_hint.enable(true)

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
      vim.keymap.set("n", "<leader>lR", function()
        vim.cmd("lsp restart")
      end, { desc = "Restart LSP" })
      vim.keymap.set("n", "<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle LSP inlay hints" })
    end,
  },
  {
    "crates.nvim",
    after = function()
      require("crates").setup({})
    end,
  },
  {
    "typescript-tools.nvim",
    after = function()
      require("typescript-tools").setup({})
    end,
  },
}
