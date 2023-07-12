-- coc.nvim config
-- extensions:
-- coc-clangd
-- coc-css
-- coc-go
-- coc-java
-- coc-json
-- coc-phpls
-- coc-pyright
-- coc-rust-analyzer
-- coc-sumneko-lua
-- coc-tsserver

local cmd = vim.cmd
local fn = vim.fn
local keymap = vim.keymap
local opt = vim.opt
local opt_local = vim.opt_local

local coc_action_async = fn.CocActionAsync
local coc_rpc_ready = fn["coc#rpc#ready"]

-- Navigate through code
keymap.set("n", "gd", "<Plug>(coc-definition)")
keymap.set("n", "gy", "<Plug>(coc-type-definition)")
keymap.set("n", "gi", "<Plug>(coc-implementation)")
keymap.set("n", "gr", "<Plug>(coc-references)")

-- Show documentation in preview window
keymap.set("n", "K", function()
	local ft = opt_local.filetype

	if ft == "vim" or ft == "help" then
		cmd.help(fn.expand "<cword>")
	elseif coc_rpc_ready() then
		coc_action_async "doHover"
	else
		cmd(string.format("!%s %s", opt.keywordprg, fn.expand "<cword>"))
	end
end)
