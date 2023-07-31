-- define your colorscheme here
local colorscheme = 'gruvbox'

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.o.background = "dark"
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end

