-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup({
    -- filetypes={"rust"},
    -- root_dir=util.root_pattern("Cargo.toml"),
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                allFeatures = true,
            },
            -- imports = 
        },
    },
})
