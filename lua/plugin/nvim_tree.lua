require("nvim-tree").setup {
	open_on_setup = true,
	view = {
		width = 30,
	},
}

-- Toggle nvim-treesitter view
require("lib/keymap").Map:set("<leader><tab>", ":NvimTreeToggle<cr>")
