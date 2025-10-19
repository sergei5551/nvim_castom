require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'pyright',
    'clangd', 
    'kotlin_language_server',
    'html',
    'cssls',
    'lua_ls',
    'jsonls'
  },
  automatic_installation = true,
})
