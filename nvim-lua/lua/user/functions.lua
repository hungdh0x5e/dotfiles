local M = {}

function M.toggle_number_on()
  vim.opt.number = true
  vim.opt.relativenumber = false
end

function M.toggle_relative_on()
  vim.opt.relativenumber = true
  vim.opt.number = true
end

return M
