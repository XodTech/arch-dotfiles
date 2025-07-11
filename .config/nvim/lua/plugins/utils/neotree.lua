vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

require("neo-tree").setup ({
    window = {
       width=25
    },
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = true,
      hide_gitignored = true,
    },
    -- unrelated
}})
