require("nvim-tree").setup {
	open_on_setup = true,
	view = {
		width = 30,
	},
}

-- Toggle nvim-treesitter view
require("map"):set("<leader><tab>", ":NvimTreeToggle")
