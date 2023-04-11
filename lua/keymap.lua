local fn = vim.fn
local g = vim.g

local map = require "map"
local exec = require("util").exec

local normal = map.normal
local visual = map.visual
local terminal = map.terminal

local insert_expr = map:new { mode = "i", opts = { silent = true, expr = true } }

-- Remap leader to spacebar - more convenient to hit
g.mapleader = " "

-- OS specific config
local preview
local shell
if vim.loop.os_uname().sysname == "Windows_NT" then
	preview = "explorer"
	shell = "pwsh"
else
	preview = "xdg-open"
	shell = "bash -l -i"
end

-- Fast config editing/reload
normal:set("<leader>ev", ":edit $MYVIMRC")
normal:set("<leader>sv", ":source $MYVIMRC")

-- Buffer navigation
normal:set("H", ":bp")
normal:set("L", ":bn")

-- Split navigation
for _, key in ipairs { "h", "j", "k", "l" } do
	normal:set(string.format("<c-%s>", key), string.format(":wincmd %s<cr>", key))
end

-- Trigger completion
insert_expr:set("<tab>", function()
	-- select next option if already visible
	if fn["coc#pum#visible"]() == 1 then
		return fn["coc#pum#next"](1)
	end

	-- check if characters before cursor is empty or whitespace
	local col = fn.col "."
	if col == 1 or fn.getline("."):sub(col - 1, col - 1):match "%s" ~= nil then
		return "<tab>"
	end

	return fn["coc#refresh"]()
end)

-- Confirm completion
insert_expr:set("<bslash>", function()
	if fn["coc#pum#visible"]() == 1 then
		return fn["coc#pum#confirm"]()
	else
		return "<bslash>"
	end
end)

-- Delete without saving into a register
normal:set("<leader>d", '"_d')
visual:set("<leader>D", '"_D')
visual:set("<leader>p", '"_dP')

-- Yank without newline
map:set("Y", "0vg_y")

-- Clear search pattern
normal:set("<leader>cs", ":let @/ = ''")

-- Close quickfix window
normal:set("<leader>cl", ":ccl")

-- Open current file with xdg-open
normal:set("<leader>b", function()
	exec(string.format("silent !%s %%", preview))
	exec "redraw!"
end)

-- Esc to normal mode when in a terminal
terminal:set("<esc>", [[<C-\><C-n>]])

local function system(cmd)
	return function()
		exec("term " .. cmd)
	end
end

-- Spawn a terminal
normal:set("<leader>t", system(shell))

-- Spawn a Python shell
normal:set("<leader>p", system "python3")
