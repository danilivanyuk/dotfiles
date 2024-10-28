-- Set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap

-- General keymaps
keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "[S]plit window [V]ertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "[S]plit window horizontall" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make [S]plit windows [E]qual width" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close split window" })
keymap.set("n", "<leader>sj", "<C-w>-", { desc = "make split window height shorter" })
keymap.set("n", "<leader>sk", "<C-w>+", { desc = "make split windows height taller" })
keymap.set("n", "<leader>sl", "<C-w>>5", { desc = "make split windows width bigger" })
keymap.set("n", "<leader>sh", "<C-w><5", { desc = "make split windows width smaller" })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "[T]ab [O]pen" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close a tab" })
-- keymap.set("n", "<tab>", ":tabn<CR>", { desc = "next tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "previous tab" })

-- Diff keymaps
keymap.set("n", "<leader>cc", ":diffput<CR>", { desc = "put diff from current to other during diff" })
keymap.set("n", "<leader>cj", ":diffget 1<CR>", { desc = "get diff from left (local) during merge" })
keymap.set("n", "<leader>ck", ":diffget 3<CR>", { desc = "get diff from right (remote) during merge" })
keymap.set("n", "<leader>cn", "]c", { desc = "next diff hunk" })
keymap.set("n", "<leader>cp", "[c", { desc = "previous diff hunk" })

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "open quickfix list" })
keymap.set("n", "<leader>qf", ":cfirst<CR>", { desc = "jump to first quickfix list item" })
keymap.set("n", "<leader>qn", ":cnext<CR>", { desc = "jump to next quickfix list item" })
keymap.set("n", "<leader>qp", ":cprev<CR>", { desc = "jump to prev quickfix list item" })
keymap.set("n", "<leader>ql", ":clast<CR>", { desc = "jump to last quickfix list item" })
keymap.set("n", "<leader>qc", ":cclose<CR>", { desc = "close quickfix list" })

-- Vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "toggle maximize tab" })

-- Nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "toggle file explorer" })
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", { desc = "toggle focus to file explorer" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "find file in file explorer" })

-- Telescope
keymap.set("n", "<leader>ss", require("telescope.builtin").builtin, { desc = "[S]earch [S]elect Telescope" })
keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
keymap.set("n", "<leader>sG", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
keymap.set("n", "<leader>sg", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
keymap.set("n", "<leader>fm", function()
	require("telescope.builtin").treesitter({ default_text = ":method:" })
end)

-- Git-blame
keymap.set("n", "<leader>gb", ":GitBlameToggle<CR>", { desc = "toggle git blame" })

-- Harpoon
keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu)
keymap.set("n", "<leader>h1", function()
	require("harpoon.ui").nav_file(1)
end)
keymap.set("n", "<leader>h2", function()
	require("harpoon.ui").nav_file(2)
end)
keymap.set("n", "<leader>h3", function()
	require("harpoon.ui").nav_file(3)
end)
keymap.set("n", "<leader>h4", function()
	require("harpoon.ui").nav_file(4)
end)
keymap.set("n", "<leader>h5", function()
	require("harpoon.ui").nav_file(5)
end)
keymap.set("n", "<leader>h6", function()
	require("harpoon.ui").nav_file(6)
end)
keymap.set("n", "<leader>h7", function()
	require("harpoon.ui").nav_file(7)
end)
keymap.set("n", "<leader>h8", function()
	require("harpoon.ui").nav_file(8)
end)
keymap.set("n", "<leader>h9", function()
	require("harpoon.ui").nav_file(9)
end)

-- Vim REST Console
keymap.set("n", "<leader>xr", ":call VrcQuery()<CR>", { desc = "Run REST query" })

-- LSP
keymap.set("n", "<leader>gg", "<cmd>lua vim.lsp.buf.hover()<CR>")
keymap.set("n", "gd", require("telescope.builtin").lsp_definitions)
keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
keymap.set("n", "gi", require("telescope.builtin").lsp_implementations)
keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
keymap.set("n", "gr", require("telescope.builtin").lsp_references)
keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
keymap.set("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("v", "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<CR>")
keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
keymap.set("n", "<leader>gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
keymap.set("n", "<leader>gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
keymap.set("n", "<leader>gn", "<cmd>lua vim.diagnostic.goto_next()<CR>")
keymap.set("n", "<leader>tr", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
keymap.set("i", "<C-Space>", "<cmd>lua vim.lsp.buf.completion()<CR>")

-- Debugging
keymap.set("n", "<leader>bb", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { desc = "" })
keymap.set(
	"n",
	"<leader>bc",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
	{ desc = "" }
)
keymap.set(
	"n",
	"<leader>bl",
	"<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
	{ desc = "" }
)
keymap.set("n", "<leader>br", "<cmd>lua require'dap'.clear_breakpoints()<cr>", { desc = "" })
keymap.set("n", "<leader>ba", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "" })
keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", { desc = "" })
keymap.set("n", "<leader>dj", "<cmd>lua require'dap'.step_over()<cr>", { desc = "" })
keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.step_into()<cr>", { desc = "" })
keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", { desc = "" })
keymap.set("n", "<leader>dd", function()
	require("dap").disconnect()
	require("dapui").close()
end)
keymap.set("n", "<leader>dt", function()
	require("dap").terminate()
	require("dapui").close()
end)
keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "" })
keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", { desc = "" })
keymap.set("n", "<leader>di", function()
	require("dap.ui.widgets").hover()
end)
keymap.set("n", "<leader>d?", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)
keymap.set("n", "<leader>df", "<cmd>Telescope dap frames<cr>")
keymap.set("n", "<leader>dh", "<cmd>Telescope dap commands<cr>")
keymap.set("n", "<leader>de", function()
	require("telescope.builtin").diagnostics({ default_text = ":E:" })
end)
