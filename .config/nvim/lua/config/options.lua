-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.autoformat = true

local opt = vim.opt
opt.encoding = "utf-8"
opt.hidden = true -- Allow editing multiple buffers without saving
opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Display cursor line number
opt.expandtab = true -- Convert tabs to spaces
opt.smartindent = true
opt.smarttab = true -- Convert tabs at the beginning of a line to spaces
opt.shiftwidth = 2 -- Default tabs to 2 spaces
opt.softtabstop = 2 --
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true -- If pattern has uppercase then case sensitive
opt.backup = false
opt.swapfile = false
opt.writebackup = false
opt.cmdheight = 1 -- Better display for messages
opt.updatetime = 300 -- Smaller updatetime for CursorHold & CursorHoldI
-- opt.shortmess = vim.opt.shortmess .. "c" -- Decrease message size
opt.signcolumn = "yes" -- Always show signcolumns
-- opt.noshowmode = true -- Don't show modes since it's displayed in Lightline
opt.grepprg = 'rg --files --follow --hidden --glob "!{.git/*,*.pyc}"'

-- vim.cmd[[colorscheme dracula]]
