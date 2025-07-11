require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "bash",
        "css",
        "dockerfile",
        "html",
        --	"javascript",
        "json",
        "json5",
        --	"lua",
        "python",
        --	"vim",
        "go",
        "rust",
        "markdown",
        --  "just"
        "toml",
        "yaml",
        "terraform",
        "hcl",
	},

  sync_install = false,
  auto_install = false,
  highlight = {enable = true},
  indent = {enable = true},
  folding = {enable = true},
})
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.foldenable = false

