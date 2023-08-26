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
	winsize = 30,
})

-- toggle browser
g.netrw_buffer = 0
local function toggle()
	if g.netrw_buffer > 0 and fn.bufloaded(g.netrw_buffer) == 1 then
		cmd.bdelete(g.netrw_buffer)
		g.netrw_buffer = 0
	else
		cmd.Hexplore()
		g.netrw_buffer = fn.bufnr()
	end
end

keymap.set("n", "`", toggle)

local project_drawer = augroup("ProjectDrawer", { clear = true })

-- open explorer on browser
autocmd({ "VimEnter" }, {
	group = project_drawer,
	pattern = "*",
	callback = function()
		if fn.argc() == 0 then
			toggle()
		end
	end,
})
