require "plugin.lualine" "tokyonight"

require("tokyonight").setup {
	style = "night",
	transparent = true,
}

vim.cmd "colorscheme tokyonight"
