local g = vim.g
local opt = vim.opt
local keymap = vim.keymap

local util = require "../util"

util.config("ale", g, {
	-- LSP
	fix_on_save = 1,
	--completion_enabled = 1,

	-- UI
	floating_preview = 1,
	hover_to_preview = 1,
	sign_error = "●",
	sign_warning = ".",

	javascript_eslint_executable = "eslint_d --cache",

	lua_stylua_options = "--search-parent-directories",

	linters = {
		go = { "govet", "staticcheck", "gopls" },
		java = { "javac" },
		javascript = { "eslint", "tsserver" },
		lua = { "luac", "lua-language-server" },
		python = { "pylint", "mypy", "pyright" },
		rust = { "cargo", "analyzer" },
		vim = {},
	},

	fixers = {
		["*"] = { "remove_trailing_lines", "trim_whitespace" },
		go = { "gofmt" },
		java = { "google_java_format" },
		javascript = { "prettier", "eslint" },
		json = { "prettier" },
		lua = { "stylua" },
		python = { "isort", "black" },
		rust = { "rustfmt" },
		typescript = { "prettier" },
	},
})

-- show documentation on hover
--keymap.set("n", "K", "<cmd>ALEHover<cr>")

-- go to definition
--keymap.set("n", "gd", "<cmd>ALEGoToDefinition<cr>")

-- next/previous error
keymap.set("n", "<leader>>", "<cmd>ALEPrevious<cr>")
keymap.set("n", "<leader><", "<cmd>ALENext<cr>")
