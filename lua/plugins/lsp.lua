-- ОБЩИЕ НАСТРОЙКИ LSP
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = '●',
    spacing = 4,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN] = '',
      [vim.diagnostic.severity.HINT] = '',
      [vim.diagnostic.severity.INFO] = '',
    }
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Общая функция для LSP
local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, bufopts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, bufopts)
end

-- ПРОСТОЙ СПОСОБ: настройка через vim.lsp.start с явным указанием cmd
local function setup_lsp(server, filetypes, extra_config)
  -- Базовые команды для серверов
  local server_cmds = {
    lua_ls = { "lua-language-server" },
    pyright = { "pyright-langserver", "--stdio" },
    clangd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
    kotlin_language_server = { "kotlin-language-server" },
    html = { "vscode-html-language-server", "--stdio" },
    cssls = { "vscode-css-language-server", "--stdio" },
    jsonls = { "vscode-json-language-server", "--stdio" },
  }
  
  local config = {
    name = server,
    cmd = server_cmds[server],
    capabilities = capabilities,
    on_attach = on_attach,
  }
  
  if extra_config then
    for k, v in pairs(extra_config) do
      config[k] = v
    end
  end
  
  vim.api.nvim_create_autocmd('FileType', {
    pattern = filetypes,
    callback = function()
      vim.lsp.start(config)
    end,
  })
end

-- Настройка серверов
setup_lsp('lua_ls', {'lua'}, {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { 
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false 
      },
      telemetry = { enable = false },
    }
  }
})

setup_lsp('pyright', {'python'}, {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      }
    }
  }
})

setup_lsp('clangd', {'c', 'cpp'})
setup_lsp('kotlin_language_server', {'kotlin'})
setup_lsp('html', {'html'})
setup_lsp('cssls', {'css'})
setup_lsp('jsonls', {'json'})


