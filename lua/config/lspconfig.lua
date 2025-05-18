Mapper = require("nvim-mapper")

local opts = { noremap = true, silent = true }

local function map_key(...) Mapper.map(...) end
local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
vim.cmd [[set completeopt+=menuone,noselect,popup]]

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        map_key('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts, "LSP", "declaration", "Go to declaration")
        map_key('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts, "LSP", "definition", "Go to definition")
        map_key('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts, "LSP", "hover", "Hover")
        map_key('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts, "LSP", "implementation",
            "Go to implementation")
        map_key('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts, "LSP", "signature_help",
            "Show signature help")
        map_key('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts, "LSP",
            "add_workspace_folder", "Add workspace folder")
        map_key('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts, "LSP",
            "remove_workspace_folder", "Remove workspace folder")
        map_key('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts, "LSP"
        , "list_workspace_folders", "List workspace folder")
        map_key('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts, "LSP", "type_definition",
            "Show type definition")
        map_key('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts, "LSP", "rename", "Rename")
        map_key('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts, "LSP", "code_action",
            "Show code actions")
        map_key('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts, "LSP", "references", "Show references")
        --map_key('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts, "LSP",
        --    "show_line_diagnostics", "Show line diagnostic")
        map_key('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts, "LSP", "goto_prev", "Go to previous")
        map_key('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts, "LSP", "goto_next", "Go to next")
        map_key('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts, "LSP", "set_loclist",
            "Set loclist")
        map_key('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts, "LSP", "formatting", "Format")
        -- Auto-format ("lint") on save.
        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end
        if client:supports_method('textDocument/completion') then
            -- Optional: trigger autocompletion on EVERY keypress. May be slow!
            client.server_capabilities.completionProvider.triggerCharacters = chars
            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
        end
    end,
})


-- Launch language servers
local servers = {
    { name = 'pyright' },
    { name = 'gopls' },
    { name = 'rust_analyzer' },
    { name = 'ts_ls' },
    { name = 'elixirls',              cmd = { '/usr/lib/elixir-ls/language_server.sh' } },
    { name = 'dartls' },
    { name = 'clangd' },
    { name = 'zls' },
    { name = 'lua_ls' },
    { name = "kotlin_language_server" },
}

for _, lsp in ipairs(servers) do
    local server_config = {
        cmd = lsp.cmd,
    }

    vim.lsp.enable(lsp.name)
    vim.lsp.config(lsp.name, server_config)
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

return servers
