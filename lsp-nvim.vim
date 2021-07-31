" Configuration for nvim-lsp.
"
" Expects the following plugins:
"   neovim/nvim-lspconfig
"   hrsh7th/nvim-compe
"
" Recommends the following plugins:
"   smbl64/vim-black-macchiato
"   folke/lsp-colors.nvim

lua << EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = {noremap = true, silent = true}

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gK', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

    buf_set_keymap('n', '<leader>g', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', 'gA', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    buf_set_keymap('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts) 
    if vim.bo.filetype ~= 'python' then
        buf_set_keymap('v', '<leader>F', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts) 
    end
end

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

-- Enable symbol highlights.
vim.api.nvim_command [[autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()]]
vim.api.nvim_command [[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]]
vim.o.updatetime = 750

-- Use nvim-compe for auto completion.
vim.o.completeopt = 'menuone,noselect'

require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    resolve_timeout = 800;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;

    source = {
        path = true;
        buffer = true;
        calc = false;
        nvim_lsp = true;
        nvim_lua = false;
        vsnip = false;
        ultisnips = false;
        luasnip = false;
    };
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<S-Tab>'
    end
end

vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', { expr = true })
vim.api.nvim_set_keymap('i', '<CR>', 'compe#confirm("<CR>")', { expr = true })

-- For debugging.
-- vim.lsp.set_log_level('debug')
EOF
