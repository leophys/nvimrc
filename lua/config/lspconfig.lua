local nvim_lsp = require('lspconfig')

-- keybindings
local on_attach = function(client, bufrn)
    vim.lsp.completion.enable(true, client.id, bufrn, {
        autotrigger = true,
        convert = function(item)
            return { abbr = item.label:gsub('%b()', '') }
        end,
    })

    Mapper = require("nvim-mapper")
    local function buf_set_keymap(...) Mapper.map_buf(bufrn, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufrn, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts, "LSP", "declaration", "Go to declaration")
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts, "LSP", "definition", "Go to definition")
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts, "LSP", "hover", "Hover")
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts, "LSP", "implementation",
        "Go to implementation")
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, "LSP", "signature_help",
        "Show signature help")
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts, "LSP",
        "add_workspace_folder", "Add workspace folder")
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts, "LSP",
        "remove_workspace_folder", "Remove workspace folder")
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts, "LSP"
    , "list_workspace_folders", "List workspace folder")
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts, "LSP", "type_definition",
        "Show type definition")
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts, "LSP", "rename", "Rename")
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts, "LSP", "code_action",
        "Show code actions")
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts, "LSP", "references", "Show references")
    --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts, "LSP",
    --    "show_line_diagnostics", "Show line diagnostic")
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts, "LSP", "goto_prev", "Go to previous")
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts, "LSP", "goto_next", "Go to next")
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts, "LSP", "set_loclist",
        "Set loclist")
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts, "LSP", "formatting", "Format")
end


-- cmp
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.dynamicRegistration = true
-- capabilities.textDocument.inlineCompletion = { dynamicRegistration = true }

-- Launch language servers
local servers = {
    { name = 'pyright' },
    --{ name = 'pylsp' },
    { name = 'gopls' },
    { name = 'rust_analyzer' },
    { name = 'ts_ls' },
    { name = 'elixirls',              cmd = { '/usr/lib/elixir-ls/language_server.sh' } },
    { name = 'dartls' },
    { name = 'clangd' },
    { name = 'zls' },
    { name = 'lua_ls' },
    { name = "kotlin_language_server" },
    { name = 'tabby' },
}
for _, lsp in ipairs(servers) do
    local server_config = {
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        },
        -- capabilities = capabilities,
    }

    for k, v in pairs(lsp) do
        server_config[k] = v
    end
    nvim_lsp[lsp.name].setup(server_config)
end

-- lsp_lines
require('lsp_lines').setup()

vim.diagnostic.config({
    virtual_text = false,
})

vim.keymap.set(
    "",
    "<space>l",
    require("lsp_lines").toggle,
    { desc = "Toggle lsp_lines" }
)


-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

return servers
