-- Configuration for nvim-lsp.
--
-- Expects the following plugins:
--   neovim/nvim-lspconfig
--   hrsh7th/nvim-compe
--
-- Recommends the following plugins:
--   smbl64/vim-black-macchiato
--   folke/lsp-colors.nvim

local nvim_lsp = require('lspconfig')
local on_attach = require('lsp-attach').on_attach

-- Load some server configs from separate files.
require('lsp-lua')

-- Make symbol highlights a little faster.
vim.o.updatetime = 1000

local linters = {
    flake8 = {
        sourceName = 'flake8',
        command = 'flake8',
        args = {[[--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s]], '-'},
        debounce = 500,
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
        formatPattern = {
            [[(\d+),(\d+),([A-Z]),(.*)(\r|\n)*$]],
            {line = 1, column = 2, security = 3, message = 4},
        },
        securities = {
            W = 'warning',
            E = 'error',
            F = 'error',
            C = 'error',
            N = 'error',
        },
    },
    mypy = {
        sourceName = 'mypy',
        command = 'mypy',
        args = {
            '--no-color-output',
            '--no-error-summary',
            '--show-column-numbers',
            '--follow-imports=silent',
            '%file'
        },
        rootPatterns = {
            'setup.py',
            'pyproject.toml',
            'setup.cfg',
            'requirements.txt',
            '.git',
        },
        debounce = 500,
        formatPattern = {
            [[^.*:(\d+?):(\d+?): ([a-z]+?): (.*)$]],
            {line = 1, column = 2, security = 3, message = 4},
        },
        securities = {
            error = 'error'
        },
    },
}

local formatters = {
    black = {
        command = 'black',
        args = {'-'},
    }
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    cmd = {'diagnostic-languageserver', '--stdio', '--log-level', '2'},
    filetypes = {'python'},
    init_options = {
        linters = linters,
        filetypes = {
            python = {'flake8', 'mypy'},
        },
        formatters = formatters,
        formatFiletypes = {
            python = 'black',
        },
    }
}

nvim_lsp.jsonls.setup {
    commands = {
        Format = {
            function()
                vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line('$'), 0})
            end
        }
    },
    flags = {
        debounce_text_changes = 150,
    },
}

local servers = { 'dockerls', 'gopls', 'jedi_language_server', 'svelte', 'tsserver' }
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
    }
end

-- Load configs for auto completion.
require('lsp-autocomplete')

-- For debugging.
-- vim.lsp.set_log_level('debug')
