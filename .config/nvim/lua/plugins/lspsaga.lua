return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      scroll_preview = {
        scroll_up = "<C-u>",
        scroll_down = "<C-d>",
      },
      lightbulb = {
        enable = true,
        enable_in_insert = false,
        sign = true,
        virtual_text = true,
      },
      finder = {
        max_height = 0.8,
        left_width = 0.3,
        keys = {
          shuttle = "<tab>",
          vsplit = "v",
          toggle_or_open = "<Enter>",
          quit = "<C-[>",
        },
      },
      rename = {
        keys = {
          -- quit = "<C-[>",
        },
      },
      code_action = {
        show_server_name = true,
        keys = {
          quit = "<C-[>",
        },
      },
      definition = {
        keys = {
          close = "<C-[>",
        },
      },
      floaterm = {
        height = 0.8,
        width = 0.8,
      },
    })
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map({ "n", "x" }, "gra", "<cmd>Lspsaga code_action<cr>", opts)
    map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opts)
    map("n", "<C-]>", "<cmd>Lspsaga goto_definition<cr>", opts)
    map("n", "grp", "<cmd>Lspsaga peek_definition<cr>", opts)
    map("n", "grf", "<cmd>Lspsaga finder<cr>", opts)
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
