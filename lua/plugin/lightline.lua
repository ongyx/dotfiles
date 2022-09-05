local nr2char = vim.fn.nr2char

vim.g.lightline = {
	separator = {
		left = nr2char(0xe0b0),
		right = nr2char(0xe0b2),
	},
	subseparator = {
		left = nr2char(0xe0b1),
		right = nr2char(0xe0b3),
	},
	colorscheme = require("config").colorscheme,
}
