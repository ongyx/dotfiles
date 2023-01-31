require("nvim-tree").setup {
	view = {
		width = 30,
	},
}

-- Toggle nvim-treesitter view
require("map"):set("<leader><tab>", ":NvimTreeToggle")
