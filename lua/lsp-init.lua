-- Configuration for nvim-lsp.
--
-- Expects the following plugins:
--   neovim/nvim-lspconfig
--   hrsh7th/nvim-compe
--
-- Recommends the following plugins:
--   smbl64/vim-black-macchiato
--   folke/lsp-colors.nvim
local nvim_lsp = require("lspconfig")
local on_attach = require("lsp-attach").on_attach

-- Load some server configs from separate files.
require("lsp-diagnosticls")
require("lsp-lua")

-- Make symbol highlights a little faster.
vim.o.updatetime = 1000

nvim_lsp.jsonls.setup {
    commands = {
        Format = {function() vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0}) end}
    },
    flags = {debounce_text_changes = 150}
}

local servers = {"dockerls", "gopls", "jedi_language_server", "rnix", "svelte", "tsserver"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {on_attach = on_attach, flags = {debounce_text_changes = 150}}
end

-- Load configs for auto completion.
require("lsp-autocomplete")

-- For debugging.
-- vim.lsp.set_log_level('debug')
