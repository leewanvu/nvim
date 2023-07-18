-- local actions = require("telescope.actions")
local Util = require("vux.util")

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.1",
  cmd = "Telescope",
  lazy = false,
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    }
  },
  keys = {
    -- find
    { "<leader>ff", Util.find_files(), desc = "Find Files" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },

    -- buffers
    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },

    -- git
    { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Commits" },
    -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Status" },
    { "<leader>gg", "<cmd>Telescope git_status<CR>", desc = "Status" },

    -- search
    { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
    { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
    { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word" },
    { "<leader>ss", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Goto Symbol" },
    { "<leader>sS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Goto Symbol (Workspace)" },
  },
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
      -- mappings = {
      --   i = {
      --     ["<C-j>"] = actions.move_selection_next,
      --     ["<C-k>"] = actions.move_selection_previous,
      --     ["<C-n>"] = actions.cycle_history_next,
      --     ["<C-p>"] = actions.cycle_history_prev,
      --   },
      --   n = {
      --     ["<C-j>"] = actions.move_selection_next,
      --     ["<C-k>"] = actions.move_selection_previous,
      --   },
      -- },
    },
  },
}
