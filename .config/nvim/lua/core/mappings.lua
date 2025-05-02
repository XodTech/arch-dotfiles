vim.g.mapleader = " "
local params = {noremap = true,silent = true}

--Custom
vim.keymap.set('n','<leader>tn',':tabedit ~/Notes <CR>',params)

--Basic

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--Disable q button
vim.keymap.set({ 'n', 'v' }, 'q', '<Nop>', { silent = true })
-- Disabling arrows in v,n modes
vim.keymap.set({'n','v'},'<Up>','<Nop>',params)
vim.keymap.set({'n','v'},'<Down>','<Nop>',params)
vim.keymap.set({'n','v'},'<Left>','<Nop>',params)
vim.keymap.set({'n','v'},'<Right>','<Nop>',params)

--User
vim.keymap.set('i','kj','<Esc>',params)
vim.keymap.set('n','<C-q>','<cmd> q <CR>',params)
vim.keymap.set('n','<C-b>','<cmd> bd <CR>',params)
vim.keymap.set('n','<C-s>','<cmd> w <CR>',params)

-- delete single character without copying into register
vim.keymap.set('n', 'd', '"_d', params)
vim.keymap.set('n', 'dd', '"_dd', params)
vim.keymap.set('n', 'r', '"_r', params)

-- NeoTree
vim.keymap.set('n', '<leader>E', ':Neotree float reveal<CR>',params)
vim.keymap.set('n', '<leader>e', ':Neotree left reveal<CR>',params)
vim.keymap.set('n', '<leader>o', ':Neotree float git_status<CR>',params)

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', params)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', params)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', params)
vim.keymap.set('n', '<leader>x', ':bdelete!<CR>', params) -- close buffer
vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', params) -- new buffer

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', params)
vim.keymap.set('v', '>', '>gv', params)
