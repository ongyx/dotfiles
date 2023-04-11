-- coc.nvim config
-- extensions:
-- coc-clangd
-- coc-css
-- coc-go
-- coc-java
-- coc-json
-- coc-pairs
-- coc-phpls
-- coc-pyright
-- coc-rust-analyzer
-- coc-sumneko-lua
-- coc-tsserver

local fn = vim.fn
local lo = vim.opt_local

local autocmd = vim.api.nvim_create_autocmd

local map = require "map"

local normal = map.normal

-- Navigate through code
normal:set("gd", "<Plug>(coc-definition)")
normal:set("gy", "<Plug>(coc-type-definition)")
normal:set("gi", "<Plug>(coc-implementation)")
normal:set("gr", "<Plug>(coc-references)")

-- Show documentation in preview window
normal:set("K", function()
	local ft = lo.filetype
	if ft == "vim" or ft == "help" then
		vim.cmd("help " .. fn.expand "<cword>")
	elseif fn["coc#rpc#ready"]() then
		fn.CocActionAsync "doHover"
	else
		vim.cmd(string.format("!%s %s", bo.keywordprg, fn.expand "<cword>"))
	end
end)

-- Don't autocomplete angle bracket pairs in HTML or PHP files
autocmd("FileType", {
	pattern = { "html", "php" },
	callback = function()
		vim.b.coc_pairs_disabled = { "<" }
	end,
})
