local MODULES = {
	"option",
	"autocmd",
	"keymap",
	"plugin.ale",
	"plugin.coc",
	"plugin.nvim_tree",
	"plugin.packer",
	"plugin.treesitter",
	"theme.tokyonight",
}

for _, module in ipairs(MODULES) do
	require(module)
end
