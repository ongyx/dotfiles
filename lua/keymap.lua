local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local keymap = vim.keymap

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

-- no arrow keys for you
for _, arrow in ipairs { "up", "down", "left", "right" } do
	keymap.set("", "<" .. arrow .. ">", "<nop>")
end

-- buffer navigation
keymap.set("n", "H", "<cmd>bprev<cr>")
keymap.set("n", "L", "<cmd>bnext<cr>")

-- split navigation (i.e., <tab> to cycle through splits, 3 <tab> to jump to the third split clockwise, etc.)
keymap.set("n", "<tab>", "<c-w><c-w>")

-- vertical/horizontal split
keymap.set("n", "sv", "<cmd>vsplit<cr>")
keymap.set("n", "sh", "<cmd>split<cr>")

-- window operations
keymap.set("n", "zw", "<cmd>write<cr>")
keymap.set("n", "zq", "<cmd>quit<cr>")
keymap.set("n", "zz", "<cmd>wq<cr>")

-- complete popup navigation
keymap.set("i", "K", function()
	if fn.pumvisible ~= 0 then
		return "<c-P>"
	end

	return "K"
end, { expr = true })

keymap.set("i", "J", function()
	if fn.pumvisible() ~= 0 then
		return "<c-N>"
	end

	return "J"
end, { expr = true })

-- esc in terminal mode
keymap.set("t", "<esc>", [[<c-\><c-n>]])

g.mapleader = " "

-- hide/clear search
keymap.set("n", "<leader>h", "<cmd>noh<cr>")
keymap.set("n", "<leader>c", [[<cmd>let @/ = ""<cr>]])

-- delete/paste using the black hole register
-- https://stackoverflow.com/a/11993928
keymap.set({ "n", "x" }, "<leader>d", [["_d]])
keymap.set("x", "<leader>p", [["_dP]])

-- terminal
keymap.set("n", "<leader>t", string.format("<cmd>term %s<cr>", shell))

-- python
keymap.set("n", "<leader>p", "<cmd>term python3<cr>")

-- open in explorer
keymap.set("n", "<leader>b", function()
	cmd(string.format("silent !%s %%", preview))
	cmd "redraw!"
end)

-- edit/source vimrc
keymap.set("n", "<leader>ve", "<cmd>edit $MYVIMRC<cr>")
keymap.set("n", "<leader>vs", "<cmd>source $MYVIMRC<cr>")
