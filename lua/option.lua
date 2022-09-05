local o = vim.opt

-- UI
o.colorcolumn = ""
o.number = true
o.shortmess:append "c"
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
o.showmode = false
o.shiftwidth = 2
o.smarttab = true
o.softtabstop = 2
o.splitbelow = true
o.splitright = true
o.tabstop = 2
