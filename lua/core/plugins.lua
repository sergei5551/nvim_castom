-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
	{'phaazon/hop.nvim'},
	{"nvim-neo-tree/neo-tree.nvim",
    		branch = "v3.x",
    		dependencies = {
      		"nvim-lua/plenary.nvim",
      		"MunifTanjim/nui.nvim",
      		"nvim-tree/nvim-web-devicons",
    		}
	},
	{'nvim-treesitter/nvim-treesitter'},
	{'joshdick/onedark.vim'},
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
        {'hrsh7th/cmp-nvim-lsp'}, {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'}, {'hrsh7th/cmp-cmdline'}, {'hrsh7th/nvim-cmp'},
    {'nvim-telescope/telescope.nvim',
      tag= '0.1.8',
      dependencies= {'nvim-lua/plenary.nvim'},
    {'windwp/nvim-autopairs'},
    {'akinsho/bufferline.nvim'},
    {'nvimdev/dashboard-nvim'},
    {'nvim-lualine/lualine.nvim',
    dependencies = {{ 'nvim-tree/nvim-web-devicons'},
                    {'nvim-mini/mini.icons'}
    }},
    {'folke/which-key.nvim'},
        {'terrortylor/nvim-comment'},
    {'akinsho/toggleterm.nvim'},
    {'CRAG666/code_runner.nvim'},
  },
})
