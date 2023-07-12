require("catppuccin").setup {
	flavour = "macchiato",
	show_end_of_buffer = true,
}

vim.cmd "colorscheme catppuccin"

require "plugin.lualine" "catppuccin"
