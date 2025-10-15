require'nvim-treesitter.configs'.setup {

  ensure_installed = { "cpp", "java", "python", "kotlin", "lua",
  "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}
