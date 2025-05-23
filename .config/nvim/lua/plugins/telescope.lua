return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--follow",
          "--hidden",
          "--glob=!{.git/*,*.pyc}",
        },
      },
    },
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      layout_strategy = "vertical",
      layout_config = { width = 0.95 },
      vimgrep_arguments = {
        "rg",
        "--color=never", -- Disables colored output from ripgrep
        "--no-heading", -- Do not include filenames as separate headings in search output
        "--with-filename", -- Always show the filename for each matched line
        "--line-number", -- Include the line number in the output for every match
        "--column", -- Include the column number of the matched text in the output
        "--smart-case", -- Searches become case-sensitive if the search pattern contains uppercase letters
        "--hidden", -- Include hidden files and directories
        "--glob=!{**/.git/*,*.pyc}", -- Exclude all files and directories
      },
      mappings = {
        i = {
          ["<C-[>"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["<sc>"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
          ["<c-t>"] = function(...)
            return require("trouble.sources.telescope").open(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["<C-[>"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["<esc>"] = function(...)
            return require("telescope.actions").close(...)
          end,
          ["<C-j>"] = function(...)
            return require("telescope.actions").move_selection_next(...)
          end,
          ["<C-k>"] = function(...)
            return require("telescope.actions").move_selection_previous(...)
          end,
        },
      },
    },
  },
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
    { "<leader>fr", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Telescope live grep" },
    { "<leader>fu", "<cmd>Telescope grep_string hidden=true<cr>", desc = "Telescope grep string" },
    { "<leader>fg", "<cmd>Telescope git_status<cr>", desc = "Telescope git status" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
    { "<leader>ft", "<cmd>Telescope tags<cr>", desc = "Telescope tags" },
    { "<leader>fc", "<cmd>Telescope command_history<cr>", desc = "Telescope command history" },
    -- { "<leader>fu", "<cmd>Telescope lsp_references<cr>", desc = "Telescope lsp refs" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
  },
}
