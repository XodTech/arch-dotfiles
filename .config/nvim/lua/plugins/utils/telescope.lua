local params = {noremap = true,silent = true}
-- Setting up a keymaps
local builtin = require('telescope.builtin')
--[[
builtin.find_files({
    file_ignore_patterns = {'.git',
    "^%. [^.zshrc.config]",
    "Images",
    "*.jpg",
    ".png",
    "bin",
},
}) Error modifiable is off 

]]--
-- Delete images from search result add maybe dotfiles and disable some useless
-- system directories like .themes

-- Working with files/greps/gits
vim.keymap.set('n', '<leader>ff', builtin.find_files, params)
vim.keymap.set('n', '<leader>ft', builtin.live_grep, params)
vim.keymap.set('n', '<leader>fb', builtin.buffers, params)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, params)

-- Work with Git
vim.keymap.set('n', '<leader>gb', builtin.git_branches, params)
vim.keymap.set('n', '<leader>gc', builtin.git_commits, params)
vim.keymap.set('n', '<leader>gs', builtin.git_status, params)

-- Chosing color scheme
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, params)

--Notes
vim.keymap.set('n','<leader>fn',':lua require("telescope.builtin").find_files({cwd = "~/Notes"})<CR>',params)
vim.keymap.set('n','<leader>gn',':lua require("telescope.builtin").live_grep({cwd = "~/Notes"})<CR>',params)
