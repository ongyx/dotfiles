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

local coc_action_async = fn["CocActionAsync"]
local coc_rpc_ready = fn["coc#rpc#ready"]
local coc_pum_visible = fn["coc#pum#visible"]
local coc_pum_confirm = fn["coc#pum#confirm"]
local coc_on_enter = fn["coc#on_enter"]

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

-- Confirm completion
keymap.set("i", "<cr>", function()
	if coc_pum_visible() == 1 then
		return coc_pum_confirm()
	else
		coc_on_enter()
		return "<cr>"
	end
end, { expr = true })
