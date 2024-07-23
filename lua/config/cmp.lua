local cmp = require('cmp')

cmp.setup({
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
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
})

local servers = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, server in ipairs(servers) do
  require('lspconfig')[server].setup {
    capabilities = capabilities
  }
end
