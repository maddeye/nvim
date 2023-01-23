vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- general keymap
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>nh", ":nohl<CR>")
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- window keymaps
keymap.set("n", "<leader>sv", "<C-w>v") -- split vertically
keymap.set("n", "<leader>sd", "<C-w>s") -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

--tabs
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab"

--maxizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
