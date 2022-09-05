local keymap = vim.keymap

local _keymap = {}

local Map = { mode = "", opts = { silent = true } }

function Map:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Map:set(lhs, rhs)
	keymap.set(self.mode, lhs, rhs, self.opts)
end

function Map:del(lhs)
	keymap.del(self.mode, lhs)
end

_keymap.Map = Map

local defaults = {
	normal = "n",
	visual = "x",
	insert = "i",
	terminal = "t",
}

for k, v in pairs(defaults) do
	_keymap[k] = Map:new { mode = v }
end

return _keymap
