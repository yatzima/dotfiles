-- main lua file
require("core.keymaps")
require("core.plugins")

-- source init.lua on save
local autocmd = vim.api.nvim_create_autocmd
autocmd('BufWritePost', {pattern = 'init.lua', command = 'source $MYVIMRC'})
