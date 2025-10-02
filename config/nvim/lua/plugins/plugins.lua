-- Autoinstall Vim-Plug
if vim.fn.empty(vim.fn.glob('~/.config/nvim/autoload/plug.vim')) == 1 then
  vim.cmd('silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
  vim.o.runtimepath = vim.o.runtimepath
  vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

-- An example of vim-plug section --------------------------------------------
local vim = vim
local Plug = vim.fn['plug#']

-- Vim-Plug
vim.call('plug#begin')
Plug('dracula/vim')                      -- Colorscheme
Plug('ctrlpvim/ctrlp.vim')               -- File finder
Plug('itchyny/lightline.vim')            -- Statusbar
Plug('neoclide/coc.nvim')                -- Autocompletion 
Plug('tpope/vim-surround')
Plug('tpope/vim-vinegar')
Plug('tpope/vim-unimpaired')
Plug('christoomey/vim-tmux-navigator')   -- Integrates with TMUX (remove maybe)
-- LSP
Plug('VonHeikemen/lsp-zero.nvim', {branch = 'v4.x'})
Plug('williamboman/mason.nvim')          -- Installs LSP Servers
Plug('williamboman/mason-lspconfig.nvim')-- 
Plug('neovim/nvim-lspconfig')
-- Autocompletion
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
vim.call('plug#end')

-- COLORSCHEME - DRACULA
vim.cmd('silent! colorscheme dracula') -- https://draculatheme.com/vim 
vim.g.dracula_italic = 1
vim.g.lightline = { colorscheme = 'darcula' }

-- Mason
require('mason').setup()
require('mason-lspconfig').setup({
   ensure_installed = { "lua_ls",  "pyright" }
})

-- LSP configuration
local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}

  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- These are just examples. Replace them with the language
-- servers you have installed in your system
require('lspconfig').pyright.setup({})
require('lspconfig').lua_ls.setup({})

-- Autocompletion setup
local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({}),
})
