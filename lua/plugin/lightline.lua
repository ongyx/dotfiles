local nr2char = vim.fn.nr2char

-- lightline has to be explicitly loaded by a theme because g:lightline is only evaluated once.
-- any modification to the table afterwards has no effect.
local function init(colorscheme)
	vim.g.lightline = {
		separator = {
			left = nr2char(0xe0b0),
			right = nr2char(0xe0b2),
		},
		subseparator = {
			left = nr2char(0xe0b1),
			right = nr2char(0xe0b3),
		},
		colorscheme = colorscheme,
	}
end

return init
