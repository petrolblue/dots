local fn = vim.fn

function mode_map(mode, lhs, rhs, opts)
  local options = {remap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

function mode_noremap(mode, lhs, rhs, opts)
  local options = {remap = false}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end

function map(lhs, rhs, opts) mode_map('', lhs, rhs, opts) end
function tmap(lhs, rhs, opts) mode_map('t', lhs, rhs, opts) end
function nmap(lhs, rhs, opts) mode_map('n', lhs, rhs, opts) end
function vmap(lhs, rhs, opts) mode_map('v', lhs, rhs, opts) end
function noremap(lhs, rhs, opts) mode_noremap('', lhs, rhs, opts) end
function tnoremap(lhs, rhs, opts) mode_noremap('t', lhs, rhs, opts) end
function nnoremap(lhs, rhs, opts) mode_noremap('n', lhs, rhs, opts) end
function vnoremap(lhs, rhs, opts) mode_noremap('v', lhs, rhs, opts) end

vim.g.mapleader = ';'

-- press escape to exit insert mode in terminal to be able to switch windows
tnoremap('<Esc>', '<C-\\><C-n>')
tmap('<C-w>', '<Esc><C-w>')

-- switch windows with tab
nmap('<Tab>', '<C-w>', {desc = 'same as <c-w>'})

-- Z to toggle folds
nnoremap('Z', 'za', {desc = 'toggle folds'})
nnoremap('<Leader>z', 'za', {desc = 'toggle folds'})

-- sort paragraphs with C-s, reverse sort with alt-s
nnoremap('<C-s>', 'vip:sort<CR>', {silent = true, desc = 'sort paragraph'})
nnoremap('<M-s>', 'vip:sort!<CR>',
    {silent = true, desc = 'sort paragraph (reverse)'})

-- yank to clipboard in visual with c-y
vnoremap('<C-y>', '"+y<CR>', {desc = 'yank to clipboard'})

-- indent file
nnoremap('g=', ':retab<CR>mvgg=G`v',
    {silent = true, desc = 'reindent/format file'})

nnoremap('<C-Up>', ':move--<CR>', {silent = true, desc = 'move line up'})
nnoremap('<C-Down>', ':move+<CR>', {silent = true, desc = 'move line down'})
nmap('<C-k>', '<C-Up>', {silent = true, desc = 'move line up'})
nmap('<C-j>', '<C-Down>', {silent = true, desc = 'move line down'})

noremap('<F7>', '<Esc>:tabp<CR>', {silent = true, desc = 'previous tab'})
noremap('<F8>', '<Esc>:tabn<CR>', {silent = true, desc = 'next tab'})
noremap('<F9>', '<Esc>:tabe<Space>', {desc = 'new tab...'})
noremap('<C-F7>', '<Esc>:bp<CR>', {silent = true, desc = 'previous buffer'})
noremap('<C-F8>', '<Esc>:bn<CR>', {silent = true, desc = 'next buffer'})

vnoremap('<', '<gv')
vnoremap('>', '>gv')

-- use <Leader>o like o, but continues comments if &fo doesn't include o
nnoremap('<Leader>o', 'A<CR>')
