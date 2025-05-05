return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "graphql",
        "kotlin",
        "java",
        "python",
        "cpp",
        "c",
        "cmake",
        "make",
        "matlab",
        "json",
      },
      highlight = { enable = true },
      indent = { enable = true },
      rainbow = { enable = true },
      -- incremental_selection = {
      --   enable = true,
      --   keymaps = {
      --     init_selection = "gnn",
      --     node_incremental = "grn",
      --     scope_incremental = "grc",
      --     node_decremental = "grm",
      --   },
      -- },
    })
  end,
}
