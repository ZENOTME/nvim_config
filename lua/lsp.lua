require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "pyright", "bashls", "gopls" },
}

local opts = { noremap = true, silent = true }
-- Genernal Keymap
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setqflist, opts)
vim.keymap.set('n', 'd,', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'd;', vim.diagnostic.goto_next, opts)

-- General Keymap for LSP
local general_on_attach = function(client, bufnr)
    vim.keymap.set('n', '<leader>h', function() vim.lsp.inlay_hint(bufnr) end, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gq', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n', 'rn', vim.lsp.buf.rename, opts)
end

-- Set for test
require("toggleterm").setup({
  direction = "float",
})

-- Rust Analyzer
local rt = require("rust-tools")
rt.setup({
  tools = { -- rust-tools options
    executor = require("rust-tools.executors").toggleterm,
  },
  server = {
    on_attach = function(client, bufnr)
      -- Gernal
      general_on_attach(client, bufnr)
      vim.keymap.set("n", "<leader>tt", rt.runnables.runnables, opts)
    end,
  },
})

-- Other LSP
local lspconfig = require('lspconfig')
require("mason-lspconfig").setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup{
        on_attach = function(client, bufnr)
            local buf_opts = { buffer = bufnr, silent = true }
            -- Gernal
            general_on_attach(client, buf_opts)
        end,
    }
  end,
  -- C++ 
  ["clangd"] = function ()
    lspconfig.clangd.setup {
      on_attach = function(client, bufnr)
        local buf_opts = { buffer = bufnr, silent = true }
        -- Gernal
        general_on_attach(client, buf_opts)
      end,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      }
    }
  end
})

