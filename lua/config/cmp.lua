local cmp = require('cmp')

cmp.setup({
    completion = {
        keyword_length = 1,
        keyword_pattern = ".*",
    },
    snippet = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Down>'] = cmp.mapping.scroll_docs(-4),
        ['<C-Up>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 0 },
        { name = 'vsnip',    keyword_length = 1 },
    }, {
        { name = 'buffer', keyword_length = 3 },
        { name = 'path',   keyword_length = 0, keyword_pattern = "\\.?/", },
    }),
    view = { entries = "custom" },
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
})
