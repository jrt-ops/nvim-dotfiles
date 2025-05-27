-- set leader key
vim.g.mapleader = "<Space>"

-- load lazy plugin manager and plugins
require("config.lazy")

local opt = vim.opt
-- default tab spacing
opt.shiftwidth = 4
-- set line numbers and relative line numbers
opt.number = true
opt.relativenumber = true

-- set clipboard to system clipboard
opt.clipboard = "unnamedplus"

require("config.keymaps")

-- show warnings and errors
vim.diagnostic.config({
  virtual_text = {
    prefix = '',
    spacing = 4
  },
  signs = true,
  underline = true,
  update_in_insert = true
})
