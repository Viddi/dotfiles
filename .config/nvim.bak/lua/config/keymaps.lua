-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = "\\"

-- Modes
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c",

-- Navigate buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-p>", ":bprevious<CR>", opts)

keymap("n", "<leader>q", ":noh<CR>", opts)

keymap("n", "<C-s>", "<esc>:w<CR>", opts)
keymap("i", "<C-s>", "<esc>:w<CR>", opts)

keymap("n", "<C-q>", "<esc>:q<CR>", opts)
keymap("i", "<C-q>", "<esc>:q<CR>", opts)
