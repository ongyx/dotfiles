local g = vim.g

local normal = require("map").normal

g.ale_linters = {
	vim = {},
	javascript = { "eslint" },
	python = { "pylint", "mypy" },
	rust = { "cargo" },
	go = { "govet", "staticcheck" },
	lua = { "luac" },
}

g.ale_fixers = {
	javascript = { "prettier", "eslint" },
	python = { "isort", "black" },
	rust = { "rustfmt" },
	go = { "gofmt" },
	json = { "jq" },
	lua = { "stylua" },
}

g.ale_javascript_eslint_executable = "eslint_d --cache"

g.ale_lua_stylua_options = "--search-parent-directories"

--g.ale_lint_on_insert_leave = 0
g.ale_fix_on_save = 1

g.ale_sign_error = "●"
g.ale_sign_warning = "."

-- Navigate through ALE errors
normal:set("<PageDown>", ":ALENext<cr>")
normal:set("<PageUp>", ":ALEPrevious<cr>")
