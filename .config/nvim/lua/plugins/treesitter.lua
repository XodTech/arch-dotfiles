require'nvim-treesitter.configs'.setup {
  ensure_installed = {
	"bash",
	"css",
--	"dockerfile",
	"html",
--	"javascript",
--	"json",
--	"json5",
--	"lua",
	"python",
--	"vim",
--	"yaml",
    "go",
    "rust",
    "markdown",
	},

  sync_install = false,
  auto_install = false,
  highlight = {enable = true},
  indent = {enable = true},
  folding = {enable = true},
}
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.foldenable = false

