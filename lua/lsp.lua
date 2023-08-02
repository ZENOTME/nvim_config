require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { "rust_analyzer" },
})


local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)

-- local inlay_hints = require('inlay-hints')
-- inlay_hints.setup({
--     hints = {
--         parameter = {
--             show = false,
--         },
--     },
-- })

-- Customized on_attach function
-- Map these key when attach server successfully
local on_attach = function(client, bufnr)
    -- vim.api.nvim_create_augroup("lsp_augroup", { clear = true })
    --
    -- vim.api.nvim_create_autocmd("InsertEnter", {
    --     buffer = bufnr,
    --     callback = function() vim.lsp.inlay_hint(bufnr, true) end,
    --     group = "lsp_augroup",
    -- })
    -- vim.api.nvim_create_autocmd("InsertLeave", {
    --     buffer = bufnr,
    --     callback = function() vim.lsp.inlay_hint(bufnr, false) end,
    --     group = "lsp_augroup",
    -- })
    vim.keymap.set('n', 'hh', function() vim.lsp.inlay_hint(bufnr) end, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- inlay_hints.on_attach(client, bufnr)
end 

-- Rust Analyzer
require("lspconfig").rust_analyzer.setup ({
    on_attach = on_attach
})

