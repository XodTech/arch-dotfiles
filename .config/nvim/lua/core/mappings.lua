vim.g.mapleader = " "
local params = {noremap = true,silent = true}
local map = vim.keymap.set

-- Basic

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

--Disable q button
map({ 'n', 'v' }, 'q', '<Nop>', { silent = true })

-- Disabling arrows in v,n modes
map({'n','v'},'<Up>','<Nop>',params)
map({'n','v'},'<Down>','<Nop>',params)
map({'n','v'},'<Left>','<Nop>',params)
map({'n','v'},'<Right>','<Nop>',params)

--User
map('i','kj','<Esc>',params)
map('n','<C-q>','<cmd> q <CR>',params)
map('n','<C-b>','<cmd> bd <CR>',params)
map('n','<C-s>','<cmd> w <CR>',params)

-- delete single character without copying into register
map({'n','v'}, 'd', '"_d', params)
map({'n','v'}, 'dd', '"_dd', params)
map('n', 'r', '"_r', params)

-- NeoTree
map('n', '<leader>E', ':Neotree float reveal<CR>',params)
map('n', '<leader>e', ':Neotree left reveal<CR>',params)
map('n', '<leader>o', ':Neotree float git_status<CR>',params)

-- Keep last yanked when pasting
map('v', 'p', '"_dP', params)

-- Buffers
map('n', '<Tab>', ':bnext<CR>', params)
map('n', '<S-Tab>', ':bprevious<CR>', params)
map('n', '<leader>x', ':bdelete!<CR>', params) -- close buffer
map('n', '<leader>b', '<cmd> enew <CR>', params) -- new buffer

-- Stay in indent mode
map('v', '<', '<gv', params)
map('v', '>', '>gv', params)

-- TODO: Maybe add mappings for gcc and gc
-- TODO: Consider adding mapping <C-o> and <C-O> for making lines above and under current line without changing mode
