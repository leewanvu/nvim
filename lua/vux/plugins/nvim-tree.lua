return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  cmd = { "NvimTreeToggle" },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" }
  },
  config = function()
    require("nvim-tree").setup {
      hijack_cursor = true,
      update_cwd = true,
      actions = {
        open_file = {
          quit_on_open = true,
        }
      },
      update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
      },

    }
  end,
}
