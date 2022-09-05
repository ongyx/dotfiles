-- coc.nvim config
-- extensions: coc-pairs coc-rust-analyzer coc-pyright coc-go coc-clangd

local fn = vim.fn
local bo = vim.bo

local keymap = require "lib/keymap"

local normal = keymap.normal
local insert = keymap.Map:new { mode = "i", opts = { silent = true, expr = true } }

-- Complete on enter
insert:set("<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<cr><c-r>=coc#on_enter()<cr>"]])

-- Navigate through code
normal:set("gd", "<Plug>(coc-definition)")
normal:set("gy", "<Plug>(coc-type-definition)")
normal:set("gi", "<Plug>(coc-implementation)")
normal:set("gr", "<Plug>(coc-references)")

-- Show documentation in preview window
normal:set("K", function()
	local ft = bo.filetype
	if ft == "vim" or ft == "help" then
		vim.cmd("help " .. fn.expand "<cword>")
	elseif fn["coc#rpc#ready"]() then
		fn.CocActionAsync "doHover"
	else
		vim.cmd(string.format("!%s %s", bo.keywordprg, fn.expand "<cword>"))
	end
end)
