local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree docu
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#A52AFF ]])

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
