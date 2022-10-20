local o = vim.opt
local cmd = vim.cmd

-- Enable spellcheck in code
cmd("syntax spell toplevel")

-- UI
o.colorcolumn = ""
o.number = true
o.shortmess = "as"
o.termguicolors = true
o.visualbell = true

-- Files
o.autochdir = true
o.fileformat = "unix"
o.fileformats = { "unix", "dos" }

-- Editing
o.clipboard = "unnamedplus"
o.completeopt = { "menuone", "noinsert" }
o.expandtab = true
o.foldmethod = "manual"
o.mouse = ""
o.showmode = false
o.shiftwidth = 2
o.smarttab = true
o.softtabstop = 2
o.splitright = true
o.splitbelow = true
o.tabstop = 2
