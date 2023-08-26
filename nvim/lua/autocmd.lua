local lo = vim.opt_local

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local spell = augroup("Spell", { clear = true })

-- Enable spelling completion when editing git commits or Markdown files
autocmd("FileType", {
	group = spell,
	pattern = { "markdown", "gitcommit" },
	callback = function()
		lo.spell = true
		lo.complete:append "kspell"
	end,
})

local custom_syntax = augroup("CustomSyntax", { clear = true })

-- use shell script syntax for auditd rules
autocmd("BufRead", {
	group = custom_syntax,
	pattern = "*.rules",
	command = "set filetype=sh",
})

-- use XML syntax for nessus audits
autocmd("BufRead", {
	group = custom_syntax,
	pattern = "*.audit",
	command = "set filetype=xml",
})
