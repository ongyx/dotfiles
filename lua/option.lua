local o = vim.opt

-- UI
o.colorcolumn = ""
o.number = true
o.shortmess = "aoOsF"
o.showmode = false
o.signcolumn = "yes"
o.termguicolors = true
o.visualbell = true

-- Files
o.autochdir = true
o.fileformat = "unix"
o.fileformats = { "unix", "dos" }

-- Indentation
o.autoindent = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- Editing
o.clipboard = "unnamedplus"
o.completeopt = { "menuone", "noinsert" }
o.foldmethod = "manual"
o.mouse = ""
o.splitright = true
o.splitbelow = true
o.linebreak = true
