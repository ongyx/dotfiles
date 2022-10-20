local map = require("map")

local normal = map.normal
local visual = map.visual
local terminal = map.terminal

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
normal:set("<leader>ev", ":vsplit $MYVIMRC<cr>")
normal:set("<leader>sv", ":source $MYVIMRC<cr>")

-- Buffer navigation
normal:set("H", ":bp<cr>")
normal:set("L", ":bn<cr>")

-- Split navigation
for _, key in ipairs({ "up", "down", "left", "right" }) do
	normal:set(string.format("<leader><%s>", key), string.format("<C-w><%s>", key))
end

-- Delete without saving into a register
normal:set("<leader>d", '"_d')
visual:set("<leader>D", '"_D')
visual:set("<leader>p", '"_dP')

-- Yank without newline
map:set("Y", "0vg_y")

-- Clear search pattern
normal:set("<leader>cs", ":let @/ = ''<cr>")

-- Close quickfix window
normal:set("<leader>cl", ":ccl<cr>")

-- Open current file with xdg-open
normal:set("<leader>b", function()
	vim.cmd(string.format("silent !%s %%", preview))
	vim.cmd("redraw!")
end)

-- Esc to normal mode when in a terminal
terminal:set("<esc>", [[<C-\><C-n>]])

local function system(cmd)
	return function()
		vim.cmd("vsplit")
		vim.cmd("term " .. cmd)
	end
end

-- Spawn a terminal
normal:set("<leader>t", system(shell))

-- Spawn a Python shell
normal:set("<leader>p", system("python3"))
