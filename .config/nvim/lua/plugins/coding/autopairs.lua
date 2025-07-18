require("nvim-ts-autotag").setup({opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  }
})

local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
})
