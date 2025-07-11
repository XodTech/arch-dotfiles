local keymap = vim.keymap
local params = { silent = true }

params.desc = "Show lsp references"
keymap.set('n',"gR","<cmd>Telescope lsp_references<CR>",params)

params.desc = "Go to declaration"
keymap.set('n',"gD",vim.lsp.buf.declaration,params)


params.desc = "Show LSP definitions"
keymap.set('n',"gd","<cmd>Telescope lsp_definitions<CR>",params)

params.desc = "Show LSP implementations"
keymap.set('n',"gi","<cmd.Telescope lsp_implementations<CR>",params)

params.desc = "Show lsp type definitons"
keymap.set('n',"gt","<cmd>Telescope lsp_type_definitions<CR>",params)

params.desc = "See avaliable code actions"
keymap.set({'n','v'},"<leader>ca",vim.lsp.buf.code_action,params)


params.desc = "Smart rename"
keymap.set("n","<leader>r",vim.lsp.buf.rename,params)

params.desc = "Show buffer diagnostics"
keymap.set("n","<leader>D","<cmd>Telescope diagnostics buffnr=0<CR>",params)

params.desc = "Show line diagnostics"
keymap.set("n","<leader>d",vim.diagnostic.open_float,params)


params.desc = "Go to previous diagnostic"
keymap.set("n","[d",vim.diagnostic.goto_prev,params)

params.desc = "Go to next diagnostic"
keymap.set("n","]d",vim.diagnostic.goto_next,params)


params.desc = "Show documentation for what is under the cursor"
keymap.set("n","K",vim.lsp.buf.hover,params)

params.desc = "Restart LSP"
keymap.set("n","<leader>rs","<cmd>LspRestart<CR>",params)

-- Setup language servers.
local lspconfig = require("lspconfig")
-- lspconfig.rust_analyzer.setup({
--     -- filetypes={"rust"},
--     -- root_dir=util.root_pattern("Cargo.toml"),
--     settings = {
--         ["rust-analyzer"] = {
--             cargo = {
--                 allFeatures = true,
--             },
--         },
--     },
-- })
vim.lsp.enable("rust_analyzer")
lspconfig.pylsp.setup {
  -- Optional settings
  settings = {
    pylsp = {
      plugins = {
        pylint = {
          enabled = true,
        },
      },
    },
  },
}

require("lspconfig").yamlls.setup{
    on_attach = on_attach,
    yaml = {
        validate = true,
        hover = true,
        completion = true,
        format = {
            enable = true,
        },
    },
    settings = {
        yaml = {
            schemas = {
                -- Docker Compose
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/main/schema/compose-spec.json"] = {"docker-compose.yml", "docker-compose.yaml"},
                -- Ansible
                ["https://raw.githubusercontent.com/ansible/ansible/main/docs/docsite/rst/static/jsonschema/ansible.json"] = {"ansible/*.yml", "ansible/*.yaml"},
                -- Kubernetes
                ["https://raw.githubusercontent.com/kubernetes/kubernetes/main/api/openapi/v2.json"] = {"k8s/*.yml", "k8s/*.yaml", "kube/*.yml", "kube/*.yaml"},
                -- GitHub workflow
                ["https://raw.githubusercontent.com/github/workflow-schema/main/json/validation.json"] = {".github/workflows/*.yml", ".github/workflows/*.yaml"},
                -- GitLab workflow (note: GitLab uses the same schema as GitHub, but with a different URL)
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {".gitlab-ci.yml", ".gitlab/*.yml", ".gitlab/*.yaml"},
            },
        },
    },
}
local signs = {
    Error = " ",
    Warn = " ",
    Hint = "󰌵 ",
    Info = " "
}

local signConf = {
    text = {},
    texthl = {},
    numhl = {},
}

for type, icon in pairs(signs) do
    local severityName = string.upper(type)
    local severity = vim.diagnostic.severity[severityName]
    local hl = "DiagnosticSign" .. type
    signConf.text[severity] = icon
    signConf.texthl[severity] = hl
    signConf.numhl[severity] = hl
end

vim.diagnostic.config({
    signs = signConf,
})

vim.diagnostic.config({
    virtual_text = true,
    -- signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
