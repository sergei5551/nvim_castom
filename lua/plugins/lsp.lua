vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })

-- Настройка отображения диагностики
vim.diagnostic.config({
  virtual_text = {
    source = "if_many",
    prefix = '●',
    spacing = 4,
    severity = { min = vim.diagnostic.severity.WARN },
  },
  signs = true,
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

-- Функция для получения filetypes по серверу
local function get_filetypes(server)
  local filetype_map = {
    lua_ls = {'lua'},
    pyright = {'python'},
    clangd = {'c', 'cpp'},
    kotlin_language_server = {'kotlin'},
    html = {'html'},
    cssls = {'css'},
    jsonls = {'json'},
  }
  return filetype_map[server] or {server}
end

-- Используем vim.lsp.start
local function setup_lsp(server, extra_config)
  local config = {
    name = server,
    capabilities = capabilities,
    on_attach = on_attach,
  }
  
  if extra_config then
    for k, v in pairs(extra_config) do
      config[k] = v
    end
  end
  
  -- Автозапуск LSP при открытии соответствующих файлов
  vim.api.nvim_create_autocmd('FileType', {
    pattern = get_filetypes(server),
    callback = function()
      vim.lsp.start(config)
    end,
  })
end

-- НАСТРОЙКА lua_ls
setup_lsp('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { 
        globals = {'vim'}
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = { enable = false },
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

-- Настройки для других серверов
setup_lsp('pyright', {
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true
      }
    }
  }
})

setup_lsp('clangd', {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
  }
})

setup_lsp('kotlin_language_server')
setup_lsp('html')
setup_lsp('cssls')
setup_lsp('jsonls')
