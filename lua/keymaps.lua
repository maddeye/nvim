local keymap = vim.keymap

keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Quicksave
vim.keymap.set("i", "<C-s>", "<ESC><CMD>:w<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- window keymaps
keymap.set("n", "<leader>sv", "<C-w>v")     -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s")     -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=")     -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- window navigation
keymap.set("n", "<leader>mh", "<C-w>h")
keymap.set("n", "<leader>mj", "<C-w>j")
keymap.set("n", "<leader>mk", "<C-w>k")
keymap.set("n", "<leader>ml", "<C-w>l")

--tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- previous tab"

--maxizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")
