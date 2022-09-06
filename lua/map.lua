local keymap = vim.keymap

local map = { mode = "", opts = { silent = true } }

function map:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function map:set(lhs, rhs)
	keymap.set(self.mode, lhs, rhs, self.opts)
end

function map:del(lhs)
	keymap.del(self.mode, lhs)
end

local defaults = {
	normal = "n",
	visual = "x",
	insert = "i",
	terminal = "t",
}

for k, v in pairs(defaults) do
	map[k] = map:new { mode = v }
end

return map
