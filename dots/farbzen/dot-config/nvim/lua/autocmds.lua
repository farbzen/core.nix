vim.api.nvim_create_autocmd("FileType", {
  desc = "remove formatoptions",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Close empty unnamed buffers once a real file is opened",
  callback = function()
    local buffers = vim.api.nvim_list_bufs()

    for _, bufnr in ipairs(buffers) do
      if
        vim.api.nvim_buf_is_loaded(bufnr)
        and vim.api.nvim_buf_get_name(bufnr) == ""
        and vim.api.nvim_get_option_value("buftype", { buf = bufnr }) == ""
      then
        local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

        local total_characters = 0

        for _, line in ipairs(lines) do
          total_characters = total_characters + #line
        end

        if total_characters == 0 then
          vim.api.nvim_buf_delete(bufnr, {
            force = true,
          })
        end
      end
    end
  end,
})

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.api.nvim_create_user_command("W", "write", { bang = true })
vim.api.nvim_create_user_command("Q", "quit", { bang = true })
