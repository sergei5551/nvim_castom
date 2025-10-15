local wk = require("which-key")

wk.add({
    { "<leader>e", "<cmd>Neotree left reveal<cr>", desc = "Open file-manage in the left" },
    { "<leader>E", "<cmd>Neotree float reveal<cr>", desc = "Open file-manage in the center" },
    
    -- Comment
    { "<leader>c", group = "Comment", desc = "Comment text" },
    { "<leader>cl", "Comment Line", desc = "Comment the selected line" },
    { "<leader>/", "<cmd>CommentToggle<CR>", desc = "Comment the selected line(base)" },

    -- Windows/files
    { "<leader>w", "<cmd>w<cr>", desc = "Save this file" },
    { "<c-s>", "<cmd>w<cr>", desc = "Save this file" },
    
    -- Tabs
    { "<leader>x", "<cmd>BufferLinePickClose<CR>", desc = "Close the select tab" },
    { "<leader>X", "<cmd>BufferLineCloseRight<cr>", desc = "Close all tabs of the right" },
    { "<leader>s", "<cmd>BufferLineSortByTabs<cr>", desc = "Sort all tabs" },
 
    -- Navigation
    { "<c-h>", "<cmd>wincmd h<CR>", desc = "Go left window" },
    { "<c-j>", "<cmd>wincmd j<CR>", desc = "Go down window" },
    { "<c-k>", "<cmd>wincmd k<CR>", desc = "Go up window" },
    { "<c-l>", "<cmd>wincmd l<CR>", desc = "Go right window" },

    -- Split
    { "|", "<cmd>vsplit<cr>", desc = "Divide vertically" },
    { "\\", "<cmd>split<cr>", desc = "Divide horizontaly" },
    
    -- Terminal
    { "<leader>t", group = "Terminal" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", desc = "Cmd in the center" },
    { "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Cmd horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical size=40<CR>", desc = "Cmd vertical" },
    
    -- Telescope
    { "<leader>f", group = "Telescope" },
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },
    
    -- Git
    { "<leader>g", group = "Git" },
    { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git commits" },
    { "<leader>gs", "<cmd>Neotree float git_status<CR>", desc = "Git status" },
    
    -- LSP
    { "<leader>l", group = "LSP" },
    { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line diagnostics" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format buffer" },
    
    -- Other
    { "<leader>h", "<cmd>nohlsearch<cr>", desc = "Deselect highlight" },
    
    -- Tabs navigation
    { "<Tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer" },
    
    -- Insert mode
    {
        mode = {"i"},
        {"jj", "<Esc>", desc = "Escape insert mode" }
}
})
