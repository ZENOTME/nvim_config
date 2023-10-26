require('general')
require('keymaps')	
require('colorscheme')

-- plugins
require('plugins')
require('lsp')
require('nvimtree')
require('gitsigns').setup()
require('Comment').setup()
require('rainbow-delimiter')
require('hop').setup { 
    keys = 'qwerasdfzxcvtyughjbmniopkl',
    vim.keymap.set('n', ',f', require'hop'.hint_char2,{remap=true}),
    vim.keymap.set('n', ',s', require'hop'.hint_char1,{remap=true})
}
