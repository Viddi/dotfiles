return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    close_if_last_window = true,
    use_libuv_file_watcher = true,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        leave_dirs_open = true,
      },
    },
    source_selector = {
      winbar = true,
      statusline = true,
    },
    window = {
      mappings = {
        ["e"] = function()
          vim.api.nvim_exec("Neotree focus filesystem left", true)
        end,
        ["b"] = function()
          vim.api.nvim_exec("Neotree focus buffers left", true)
        end,
        ["g"] = function()
          vim.api.nvim_exec("Neotree focus git_status left", true)
        end,
      },
    },
  },
  keys = {
    { "<leader>es", "<cmd>Neotree toggle<cr>", desc = "Neotree show" },
    {
      "<leader>ef",
      function()
        vim.cmd("Neotree reveal_file=" .. vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)))
      end,
      desc = "Neotree reveal current file",
    },
  },
}

-- vim.api.nvim_create_user_command("NeoTreeRevealCurrent", function()
--   local current_file = vim.api.nvim_buf_get_name(0)
--   if current_file == "" then
--     print("No file currently open.")
--     return
--   end
--   vim.cmd("Neotree reveal_file=" .. vim.fn.fnameescape(current_file) .. " reveal_force_cwd")
-- end, {})
