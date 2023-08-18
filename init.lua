local function import(modules)
	for _, module in ipairs(modules) do
		require(module)
	end
end

local base = { "option", "autocmd", "keymap" }
local plugin = { "plugin.netrw", "plugin.ale", "plugin.coc", "plugin.packer", "plugin.treesitter" }
local theme = { "theme.monokai_pro" }

import(base)
import(plugin)
import(theme)
