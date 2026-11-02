local function contains(table, value)
  for _, v in ipairs(table) do
    if v == value then
      return true
    end
  end

  return false
end

local exclude_ft = {
  "snacks_picker_list",
  "snacks_terminal",
  "neo-tree",
  "neo-tree-popup",
}

local mode = vim.fn.mode()
if not contains(exclude_ft, vim.o.filetype) then
  vim.wo.relativenumber = (mode ~= "i")
end

local group = vim.api.nvim_create_augroup("smartnumber", { clear = true })

vim.api.nvim_create_autocmd("InsertEnter", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      vim.wo.relativenumber = false
      vim.cmd("redraw")
    end
  end,
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      vim.wo.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd("WinEnter", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      mode = vim.fn.mode()
      vim.wo.relativenumber = (mode ~= "i")
    end
  end,
})

vim.api.nvim_create_autocmd("WinLeave", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      vim.wo.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd("FocusGained", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      mode = vim.fn.mode()
      vim.wo.relativenumber = (mode ~= "i")
    end
  end,
})

vim.api.nvim_create_autocmd("FocusLost", {
  group = group,
  callback = function()
    if not contains(exclude_ft, vim.o.filetype) then
      vim.wo.relativenumber = false
    end
  end,
})
