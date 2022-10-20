local fn = vim.fn
local lo = vim.opt_local

local autocmd = vim.api.nvim_create_autocmd

-- Enable spellcheck when editing git commits or Markdown files
autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	callback = function()
		lo.spell = true
		lo.spelllang = "en_us"
		lo.complete:append("kspell")
	end,
})

-- Move cursor to the new split when opening documentation
autocmd("BufEnter", {
	pattern = { "__run__", "__doc__" },
	callback = function()
		vim.cmd("wincmd L")
	end,
})

-- Close preview windows when exiting insert mode
autocmd("InsertLeave", {
	callback = function()
		if fn.pumvisible() == 0 then
			vim.cmd("pclose")
		end
	end,
})
