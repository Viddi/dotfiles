return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = true,
        virtual_text = true,
      },
    })
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    -- Lspsaga keybindings
    map({ "n", "x" }, "ga", "<cmd>Lspsaga code_action<cr>", opts)
    map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opts)
    -- map("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
    -- map("n", "gp", "<cmd>Lspsaga peek_definition<cr>", opts)
    -- map("n", "gr", "<cmd>Lspsaga finder<cr>", opts)
    map("n", "gn", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
    map("n", "gp", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    map("n", "grn", "<cmd>Lspsaga rename<cr>", opts)
    map({ "n", "t" }, "<A-f>", "<cmd>Lspsaga term_toggle<cr>", opts)
    -- map("n", "<leader>o", "<cmd>Lspsaga outline<cr>", opts)
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
