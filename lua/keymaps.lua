vim.g.mapleader = " "
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-- Hint: see `:h vim.map.set()`
-- The keymap except lsp related

-- Cursor movement in insert 
vim.keymap.set('i', '<C-h>', '<Left>', opts)
vim.keymap.set('i', '<C-j>', '<Down>', opts)
vim.keymap.set('i', '<C-k>', '<Up>', opts)
vim.keymap.set('i', '<C-l>', '<Right>', opts)
vim.keymap.set('i', '<C-c>', '<ESC>', opts)

-- Better window navigation
vim.keymap.set('n', '<Tab>h', '<C-w>h', opts)
vim.keymap.set('n', '<Tab>j', '<C-w>j', opts)
vim.keymap.set('n', '<Tab>k', '<C-w>k', opts)
vim.keymap.set('n', '<Tab>l', '<C-w>l', opts)
vim.keymap.set('n', '<C-q>', '<C-w>q', opts)

--- Telescope
vim.keymap.set('n', '<leader>tf', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<CR>', opts)

--- NvimTree
vim.keymap.set("n","<leader>fs", ":NvimTreeToggle<CR>")
