local g = vim.g

g.ale_linters = {
	vim = {},
	javascript = { "eslint" },
	python = { "pylint", "mypy", "pyright" },
	rust = { "cargo", "rust-analyzer" },
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

-- Misc. language options
g.ale_javascript_eslint_executable = "eslint_d --cache"

g.ale_lua_stylua_options = "--search-parent-directories"

-- LSP
g.ale_fix_on_save = 1

-- UI
g.ale_hover_to_preview = 1
g.ale_sign_error = "●"
g.ale_sign_warning = "."
