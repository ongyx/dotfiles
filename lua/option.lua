local opt = vim.opt

local util = require "../util"

util.config(nil, opt, {
	-- editing
	autoindent = true,
	completeopt = { "longest", "menuone" },
	shiftwidth = 4,
	expandtab = true,
	mouse = "",
	smartindent = true,
	splitbelow = true,
	splitright = true,
	tabstop = 4,

	-- files
	autochdir = true,
	confirm = true,
	fileencoding = "utf-8",
	fileformat = "unix",

	-- appearance
	showmode = false,
	number = true,
	linebreak = true,
	relativenumber = true,
	shortmess = "aoOsF",
	signcolumn = "yes",
})
