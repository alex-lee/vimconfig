-- Configuration for lua-language-server.
-- Adapted from nvim-lspconfig.
--
-- For easiest setup, install tools using nix:
-- nixpkgs.sumneko-lua-language-server
-- nixpkgs.luaformatter
local nvim_lsp = require("lspconfig")
local on_attach = require("lsp-attach").on_attach

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {"vim"}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}
