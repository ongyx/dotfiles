local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local keymap = vim.keymap

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local util = require "../util"

util.config("netrw", g, {
	banner = 0,
	liststyle = 3,
	browse_split = 4,
	altv = 1,
	winsize = 25,
})

-- toggle browser
keymap.set("n", "<leader><tab>", "<cmd>Lexplore<cr>")

local project_drawer = augroup("ProjectDrawer", { clear = true })

-- open explorer on browser
autocmd({ "VimEnter" }, {
	group = project_drawer,
	pattern = "*",
	callback = function()
		if fn.argc() == 0 then
			cmd "Lexplore"
		end
	end,
})
