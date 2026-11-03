return {
  {
    "lualine.nvim",
    auto_enable = true,
    after = function()
      local noice_status = require("noice").api.status.mode
      require("lualine").setup({
        options = {
          section_separators = {
            left = "",
            right = "",
          },
          component_separators = {
            left = "",
            right = "",
          },
          ignore_focus = {
            "dapui_watches",
            "dapui_breakpoints",
            "dapui_scopes",
            "dapui_console",
            "dapui_stacks",
            "dap-repl",
            "neotest-summary",
            "neo-tree",
            "snacks_picker_list",
            "snacks_terminal",
          },
        },
        winbar = {
          lualine_a = {
            {
              function()
                return ""
              end,
              separator = { left = "▎" },
            },
            {
              "",
              draw_empty = true,
              separator = { right = "" },
            },
          },
          lualine_b = {
            {
              function()
                local trunc_len = 26
                local path = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")

                if #path > (trunc_len + 3) then
                  return path:sub(1, trunc_len) .. "..."
                end

                return path
              end,
            },
          },
          lualine_c = { "navic" },
          lualine_x = {
            {
              noice_status.get,
              fmt = function(str)
                if noice_status.has() and string.find(noice_status.get(), "recording") then
                  return str:gsub(".*(recording%W%W%w).*", "%1")
                end

                return ""
              end,
            },
          },
          lualine_y = {
            {
              "",
              draw_empty = true,
              separator = {
                left = "",
              },
            },
            {
              function()
                local status = require("dap").status()
                if status == "" then
                  return ""
                elseif string.find(status, "Running") == 1 then
                  return ""
                elseif string.find(status, "Stopped") == 1 then
                  return ""
                end
                return ""
              end,
            },
            "tacho",
          },
          lualine_z = {
            {
              "",
              draw_empty = true,
              separator = { left = "" },
            },
            "progress",
          },
        },
        sections = {
          lualine_a = {
            {
              "mode",
              separator = { left = "▎" },
            },
            {
              "",
              draw_empty = true,
              separator = {
                left = "",
                right = "",
              },
            },
          },
          lualine_b = {
            {
              "filetype",
              colored = true,
              icon_only = true,
              icon = { align = "left" },
            },
            {
              "filename",
              symbols = {
                modified = " ",
                readonly = " ",
              },
            },
          },
          lualine_c = {
            "diff",
            {
              "diagnostics",
              sources = { "nvim_lsp", "nvim_diagnostic", "nvim_diagnostic", "vim_lsp", "coc" },
              symbols = {
                error = "󰅙  ",
                warn = "  ",
                info = "  ",
                hint = "󰌵 ",
              },
              colored = true,
              update_in_insert = false,
              always_visible = false,
              diagnostics_color = {
                color_error = { fg = "red" },
                color_warn = { fg = "yellow" },
                color_info = { fg = "cyan" },
              },
            },
          },
          lualine_x = {
            {
              function()
                local buf_ft = vim.bo.filetype
                local excluded_buf_ft = {
                  toggleterm = true,
                  NvimTree = true,
                  ["neo-tree"] = true,
                  TelescopePrompt = true,
                }

                if excluded_buf_ft[buf_ft] then
                  return ""
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local clients = vim.lsp.get_clients({ bufnr = bufnr })

                if vim.tbl_isempty(clients) then
                  return ""
                end

                local active_clients = {}
                for _, client in ipairs(clients) do
                  table.insert(active_clients, client.name)
                end

                return table.concat(active_clients, ", ")
              end,
              icon = " ",
              separator = { left = "" },
            },
          },
          lualine_y = {
            {
              "",
              draw_empty = true,
              separator = {
                left = "",
                right = "",
              },
            },
            {
              "searchcount",
              maxcount = 999,
              timeout = 120,
            },
            {
              "branch",
              fmt = function(str)
                local trunc_len = 16

                if #str > (trunc_len + 3) then
                  return str:sub(1, trunc_len) .. "..."
                end

                return str
              end,
              icon = " •",
            },
          },
          lualine_z = {
            {
              "",
              draw_empty = true,
              separator = {
                left = "",
                right = "",
              },
            },
            "location",
            {
              "fileformat",
              color = { fg = "black" },
              symbols = {
                unix = "",
                dos = "",
                mac = "",
              },
            },
          },
        },
      })
    end,
  },
  {
    "nvim-navic",
    dep_of = { "lualine.nvim" },
    after = function()
      require("nvim-navic").setup({
        lsp = { auto_attach = true },
        depth_limit = 3,
      })
    end,
  },
}
