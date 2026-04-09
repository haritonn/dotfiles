vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.keymaps")
require("config.lazy")

-- dark theme
-- vim.cmd[[catppuccin-mocha]]
vim.cmd.colorscheme("catppuccin-mocha")

-- light theme
-- vim.cmd[[colorscheme tokyonight-day]]

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set("n", "<CR>", function()
      local line = vim.api.nvim_win_get_cursor(0)[1]
      vim.cmd(line .. "cc")
    end, { buffer = true, noremap = true, nowait = true })
  end,
})

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
