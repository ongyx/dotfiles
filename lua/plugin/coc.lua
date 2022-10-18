-- coc.nvim config
-- extensions: coc-pairs coc-rust-analyzer coc-pyright coc-go coc-clangd coc-sumneko-lua coc-json

local fn = vim.fn
local bo = vim.bo

local map = require "map"

local normal = map.normal
local insert = map:new { mode = "i", opts = { silent = true, expr = true } }

-- Complete on enter
insert:set("<cr>", function()
	if fn["coc#pum#visible"]() == 1 then
		fn["coc#pum#confirm"]()
	else
		return [[<cr>]]
	end
end)

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
