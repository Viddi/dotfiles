return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    require("which-key").setup({
      preset = "modern",
      icons = {
        mappings = vim.g.have_nerd_font ~= false,
      },
    })

    -- Document existing key chains (groups)
    require("which-key").add({
      -- Leader key groups for better organization
      { "<leader>f", group = "Find" },
      { "<leader>t", group = "Toggle" },
      { "<leader>g", group = "Git" },
      { "<leader>b", group = "Buffer" },
      { "<leader>e", group = "Explorer" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>c", group = "Code" },
      { "<leader>l", group = "LSP" },
      { "<leader>d", group = "Debug" },
      { "gr", group = "LSP Goto" },
    })
  end,
}
