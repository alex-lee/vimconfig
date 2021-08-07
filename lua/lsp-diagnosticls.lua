-- Configuration for diagnostic-languageserver.
local nvim_lsp = require("lspconfig")
local on_attach = require("lsp-attach").on_attach

local linters = {
    flake8 = {
        sourceName = "flake8",
        command = "flake8",
        args = {[[--format=%(row)d,%(col)d,%(code).1s,%(code)s: %(text)s]], "-"},
        debounce = 500,
        offsetLine = 0,
        offsetColumn = 0,
        formatLines = 1,
        formatPattern = {
            [[(\d+),(\d+),([A-Z]),(.*)(\r|\n)*$]], {line = 1, column = 2, security = 3, message = 4}
        },
        securities = {W = "warning", E = "error", F = "error", C = "error", N = "error"}
    },
    mypy = {
        sourceName = "mypy",
        command = "mypy",
        args = {
            "--no-color-output", "--no-error-summary", "--show-column-numbers",
            "--follow-imports=silent", "%file"
        },
        rootPatterns = {"setup.py", "pyproject.toml", "setup.cfg", "requirements.txt", ".git"},
        debounce = 500,
        formatPattern = {
            [[^.*:(\d+?):(\d+?): ([a-z]+?): (.*)$]],
            {line = 1, column = 2, security = 3, message = 4}
        },
        securities = {error = "error"}
    }
}

local formatters = {
    black = {command = "black", args = {"-"}},
    lua_format = {command = "lua-format", args = {"-i"}}
}

nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    cmd = {"diagnostic-languageserver", "--stdio", "--log-level", "2"},
    filetypes = {"lua", "python"},
    init_options = {
        linters = linters,
        filetypes = {python = {"flake8", "mypy"}},
        formatters = formatters,
        formatFiletypes = {lua = "lua_format", python = "black"}
    }
}
