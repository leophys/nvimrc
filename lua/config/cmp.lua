local cmp = require('cmp')

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local select_opts = { behavior = cmp.SelectBehavior.Select }

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
        ['<Tab>'] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1

            if cmp.visible() then
                cmp.select_next_item(select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                fallback()
            else
                cmp.complete()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(select_opts)
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        -- { { name = 'nvim_lsp' }, { name = 'vsnip' } }, { { name = 'buffer' }, { name = 'path' } }
        { name = 'nvim_lsp', score = 3 },
        { name = 'vsnip',    score = 3 },
        { name = 'buffer',   score = 1 },
        { name = 'path',     score = 1, keyword_pattern = "\\.?/", },
    }),
    --view = { entries = "custom" },
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
