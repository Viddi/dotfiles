-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

vim.opt.encoding = "utf-8"
vim.opt.hidden = true -- Allow editing multiple buffers without saving
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.number = true -- Display cursor line number
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.smartindent = true
vim.opt.smarttab = true -- Convert tabs at the beginning of a line to spaces
vim.opt.shiftwidth = 2 -- Default tabs to 2 spaces
vim.opt.softtabstop = 2 --
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- If pattern has uppercase then case sensitive
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.cmdheight = 1 -- Better display for messages
vim.opt.updatetime = 300 -- Smaller updatetime for CursorHold & CursorHoldI
-- vim.opt.shortmess = vim.opt.shortmess .. "c" -- Decrease message size
vim.opt.signcolumn = "yes" -- Always show signcolumns
-- vim.opt.noshowmode = true -- Don't show modes since it's displayed in Lightline
vim.opt.grepprg = "rg --files --follow --hidden --glob '!{.git/*,*.pyc}'"

local map = vim.keymap.set
-- map("n", "<C-n>", ":bnext<cr>", { silent = true, desc = "Cycle next buffer" })
-- map("n", "<C-p>", ":bprevious<cr>", { silent = true, desc = "Cycle previous buffer" })
-- map("n", "<leader>x", ":bdelete<cr>", { silent = true, desc = "Kill current buffer" })
-- map("n", "<leader>X", ":bd<cr>", { silent = true, desc = "Kill current buffer and pane" })

map("n", "<leader>q", ":noh<cr>", { silent = true, desc = "Remove search highlights" })

map("n", "<C-s>", "<esc>:w<cr>", { silent = true, desc = "Save in normal mode" })
map("i", "<C-s>", "<esc>:w<cr>", { silent = true, desc = "Save in insert mode" })

map("n", "<C-q>", "<esc>:q<cr>")
map("i", "<C-q>", "<esc>:q<cr>")

map("n", "=", [[<cmd>vertical resize +3<cr>]], { desc = "Increase window width +3" })
map("n", "-", [[<cmd>vertical resize -3<cr>]], { desc = "Decrease window width -3" })
map("n", "+", [[<cmd>horizontal resize +2<cr>]], { desc = "Increase window height +2" })
map("n", "_", [[<cmd>horizontal resize -2<cr>]], { desc = "Decrease window height -2" })

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    {
      "folke/tokyonight.nvim",
      lazy = false, -- make sure we load this during startup if it is your main colorscheme
      priority = 1000, -- make sure to load this before all the other start plugins
      opts = { style = "moon" },
      config = function()
        vim.cmd([[colorscheme tokyonight-moon]])
      end,
    },

    { import = "plugins" },

    -- {
    --   "folke/persistence.nvim",
    --   event = "BufReadPre",
    --   opts = {},
    --   -- stylua: ignore
    --   keys = {
    --     { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    --     { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
    --     { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    --     { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    --   },
    -- },

    -- TODO:
    -- Add a way to read todo's
    -- Add DAP
    -- Add Which-Key
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})
