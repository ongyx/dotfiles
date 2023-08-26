local diagnostic = vim.diagnostic
local lsp = vim.lsp.buf
local keymap = vim.keymap

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Global keymaps
keymap.set("n", "<space>e", diagnostic.open_float)
keymap.set("n", "[d", diagnostic.goto_prev)
keymap.set("n", "]d", diagnostic.goto_next)
keymap.set("n", "<space>q", diagnostic.setloclist)

-- LSP-specific keymaps
autocmd("LspAttach", {
	group = augroup("UserLspConfig", {}),
	callback = function(ev)
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = ev.buf }
		keymap.set("n", "gD", lsp.declaration, opts)
		keymap.set("n", "gd", lsp.definition, opts)
		keymap.set("n", "K", lsp.hover, opts)
		keymap.set("n", "gi", lsp.implementation, opts)
		keymap.set("n", "<C-k>", lsp.signature_help, opts)
		keymap.set("n", "<space>wa", lsp.add_workspace_folder, opts)
		keymap.set("n", "<space>wr", lsp.remove_workspace_folder, opts)
		keymap.set("n", "<space>wl", function()
			print(vim.inspect(lsp.list_workspace_folders()))
		end, opts)
		keymap.set("n", "<space>D", lsp.type_definition, opts)
		keymap.set("n", "<space>rn", lsp.rename, opts)
		keymap.set({ "n", "v" }, "<space>ca", lsp.code_action, opts)
		keymap.set("n", "gr", lsp.references, opts)
		keymap.set("n", "<space>f", function()
			lsp.format { async = true }
		end, opts)
	end,
})

-- Languages
local handlers = {
	function(server)
		require("lspconfig")[server].setup {}
	end,
}

-- Lua
handlers.lua_ls = function()
	require("lspconfig").lua_ls.setup {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					checkThirdParty = false,
					library = vim.api.nvim_get_runtime_file("lua", true),
				},
			},
		},
	}
end

return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			local mason_lsp = require "mason-lspconfig"
			mason_lsp.setup()
			mason_lsp.setup_handlers(handlers)
		end,
	},
	{
		"neovim/nvim-lspconfig",
	},
}
