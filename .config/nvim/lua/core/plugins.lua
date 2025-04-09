local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
 
       lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
},
{
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdaTE"
},
{"akinsho/bufferline.nvim", dependencies = {'nvim-tree/nvim-web-devicons'}},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
{"catppuccin/nvim", name = "catppuccin", priority = 1000 },
{'neovim/nvim-lspconfig'},
{'nvimdev/dashboard-nvim'},
{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
},
{'windwp/nvim-ts-autotag'},
{'terrortylor/nvim-comment'},
{'lewis6991/gitsigns.nvim'},
{
	  "folke/todo-comments.nvim",
	  dependencies = { "nvim-lua/plenary.nvim" },
	  opts = {
	    -- your configuration comes here
	    -- or leave it empty to use the default settings
	    -- refer to the configuration section below
	  },
},
{"hrsh7th/nvim-cmp"},
{"hrsh7th/cmp-nvim-lsp"},
{"hrsh7th/cmp-path"},
{"hrsh7th/cmp-buffer"},
--[[{
    'saecki/crates.nvim',
    ft = {"rust","toml"},
    tag = 'stable',
    config = function()
        require('crates').setup(opts)
        crates.show()
        --Maybe later add crate autocompletion with cmp
    end,
},]]--
{ 'norcalli/nvim-colorizer.lua' },
{
    dir = '~/.config/nvim/local_plugins/render-markdown',
    ft = {"markdown"},
},
{'akinsho/toggleterm.nvim', version = "*", config = true},
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
})
