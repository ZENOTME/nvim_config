---@diagnostic disable: trailing-space
-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------------------------------
    -- NOTE: PUT YOUR THIRD PLUGIN HERE --
    ---------------------------------------
    -- Install scheme
    use 'ellisonleao/gruvbox.nvim'

    -- Install LSP
    use "williamboman/mason-lspconfig.nvim"
    use 'williamboman/mason.nvim'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Install Debugging
    use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'
    use 'simrat39/inlay-hints.nvim'

    -- Auto completation
    use { 'hrsh7th/nvim-cmp', config = [[require('nvim-cmp')]] }
    use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
    use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }      -- buffer auto-completion
    use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }        -- path auto-completion
    use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }     -- cmdline auto-completion
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- Copilot
    use 'github/copilot.vim'

    -- File manager
    use({
        "kyazdani42/nvim-tree.lua",
        "kyazdani42/nvim-web-devicons",     -- optional, for file icons
    })

    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use { 'nvim-treesitter/nvim-treesitter' }

    -- rainbow-delimiters
    use 'HiPhish/rainbow-delimiters.nvim'

    -- Git Tool
    use 'tpope/vim-fugitive'
    use({
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    use 'lewis6991/gitsigns.nvim'
    use 'f-person/git-blame.nvim'

    -- terminal tool
    use 'akinsho/toggleterm.nvim'
    -- comment tool
    use 'numToStr/Comment.nvim'

    -- hop tool (easymotion)
    use {
        'smoka7/hop.nvim',
        tag = '*', -- optional but strongly recommended
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
