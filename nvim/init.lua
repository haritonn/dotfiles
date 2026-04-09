vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.keymaps")
require("config.lazy")

-- dark theme
-- vim.cmd[[catppuccin-mocha]]
vim.cmd.colorscheme("catppuccin-mocha")

-- light theme
-- vim.cmd[[colorscheme tokyonight-day]]


-- useful opts
vim.opt.nu=true
vim.opt.relativenumber=true
vim.opt.cursorline=true
vim.opt.list=true
vim.opt.clipboard="unnamedplus"

vim.opt.softtabstop=2
vim.opt.tabstop=2
vim.opt.expandtab=true
vim.opt.autoindent=true
