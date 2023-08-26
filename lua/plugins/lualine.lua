local nr2char = vim.fn.nr2char

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup {
				options = {
					section_seperators = {
						left = nr2char(0xe0b0),
						right = nr2char(0xe0b2),
					},
					component_seperators = {
						left = nr2char(0xe0b1),
						right = nr2char(0xe0b3),
					},
				},
				sections = {
					lualine_b = {
						{ "branch" },
						{ "diff" },
						{
							"diagnostics",
							sources = { "ale", "coc" },
							sections = { "error", "warn", "info", "hint" },
							colored = true,
						},
					},
				},
			}
		end,
	},
}
