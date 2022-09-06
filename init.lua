local MODULES = {
	"option",
	"autocmd",
	"keymap",
	"plugin.packer",
	"plugin.nvim_tree",
	"plugin.ale",
	"plugin.coc",
	"plugin.supertab",
	"theme.paramount",
}

for _, module in ipairs(MODULES) do
	require(module)
end
