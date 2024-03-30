return {
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
			},
		},
		build = function()
			require("telescope").load_extension("fzf")
		end,
		keys = function()
			return {
				{ "<leader>fb", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
				{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
				{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
				{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
				-- find
				-- { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
				-- { "<leader>fF", function() require("telescope.builtin").find_files({ cwd = false }) end, desc = "Find Files (cwd)" },
				-- { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
				-- git
				-- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
				{ "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
				-- search
				-- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
				{ "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
				-- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
				{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
				{ "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
				-- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
				-- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
				{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
				-- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
				{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
				-- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
				{ "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
				-- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
				-- { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
				{
					"<leader>sw",
					function()
						require("telescope.builtin").grep_string()
					end,
					desc = "Word (root dir)",
				},
				-- { "<leader>sW", function() require("telescope.builtin").grep_string({ cwd = false }) end, desc = "Word (cwd)" },
				-- { "<leader>uC", function() require("telescope.builtin").colorscheme({ enable_preview = true }) end, desc = "Colorscheme with preview" },
				-- {
				--   "<leader>ss",
				--   Util.telescope("lsp_document_symbols", {
				--     symbols = {
				--       "Class",
				--       "Function",
				--       "Method",
				--       "Constructor",
				--       "Interface",
				--       "Module",
				--       "Struct",
				--       "Trait",
				--       "Field",
				--       "Property",
				--     },
				--   }),
				--   desc = "Goto Symbol",
				-- },
				-- {
				--   "<leader>sS",
				--   Util.telescope("lsp_workspace_symbols", {
				--     symbols = {
				--       "Class",
				--       "Function",
				--       "Method",
				--       "Constructor",
				--       "Interface",
				--       "Module",
				--       "Struct",
				--       "Trait",
				--       "Field",
				--       "Property",
				--     },
				--   }),
				--   desc = "Goto Symbol (Workspace)",
				-- },
			}
		end,
	},
}
