local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local format = augroup("Format", { clear = true })

autocmd("BufWritePost", {
	group = format,
	pattern = "",
	command = "FormatWrite",
})

return {
	{
		"mhartington/formatter.nvim",
		config = function()
			local js = require "formatter.filetypes.javascript"
			local py = require "formatter.filetypes.python"

			require("formatter").setup {
				logging = true,
				log_level = vim.log.levels.WARN,
				filetype = {
					go = {
						require("formatter.filetypes.go").gofmt,
					},
					java = {
						require("formatter.filetypes.java").clangformat,
					},
					javascript = { js.denofmt },
					json = {
						require("formatter.filetypes.javascript").denofmt,
					},
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					python = {
						py.isort,
						py.black,
					},
					["*"] = {
						require("formatter.filetypes.any").remove_trailing_whitespace,
					},
				},
			}
		end,
	},
}
