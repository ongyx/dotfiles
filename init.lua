local function import(modules)
	for _, module in ipairs(modules) do
		require(module)
	end
end

local base = { "option", "autocmd", "keymap" }
local plugin_basic = { "plugin.ale", "plugin.netrw" }
local plugin_fancy = { "plugin.packer", "plugin.treesitter" }
local theme = { "theme.tokyonight" }

import(base)
import(plugin_basic)
import(plugin_fancy)
import(theme)
