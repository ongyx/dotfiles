local map = require "map"

local normal = map.normal
local visual = map.visual
local terminal = map.terminal

-- Fast config editing/reload
normal:set("<leader>ev", ":vsplit $MYVIMRC<cr>")
normal:set("<leader>sv", ":source $MYVIMRC<cr>")

-- Buffer navigation
normal:set("H", ":bp<cr>")
normal:set("L", ":bn<cr>")

-- Split navigation
for _, key in ipairs { "up", "down", "left", "right" } do
	normal:set(("<leader><%s>").format(key), ("<C-w><%s>").format(key))
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
	vim.cmd "silent !xdg-open %"
	vim.cmd "redraw!"
end)

-- Esc to normal mode when in a terminal
terminal:set("<Esc>", [[<C-\><C-n>]])

local function system(cmd)
	return function()
		vim.cmd "vsplit"
		vim.cmd("term " .. cmd)
	end
end

-- Powershell is used on Windows, otherwise Bash.
local shell = vim.loop.os_uname().sysname == "Windows" and "pwsh.exe" or "bash -l -i"

-- Spawn a terminal
normal:set("<leader>t", system(shell))

-- Spawn a Python shell
normal:set("<leader>p", system "python3")
