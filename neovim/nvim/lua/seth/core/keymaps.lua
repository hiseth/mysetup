vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "ii", "<Esc>")
keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sx", ":close<cr>")

-- NvimTree
keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
keymap.set("n", "<leader>f", ":NvimTreeFocus<cr>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>lds", "<cmd>Telescope lsp_document_symbols<cr>") -- list all functions/structs/classes/modules in the current buffer

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- venv-selector
keymap.set("n", "<leader>vs", "<cmd>:VenvSelect<cr>")
keymap.set("n", "<leader>vc", "<cmd>:VenvSelectCached<cr>")

-- bufferline
keymap.set("n", "<leader>ll", ":bnext<cr>")
keymap.set("n", "<leader>hh", ":bprevious<cr>")

-- toggleterm
keymap.set("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>")
keymap.set("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>")
keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>")
keymap.set("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<cr>")
keymap.set("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<cr>")
