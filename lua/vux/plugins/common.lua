return {
  -- icons
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- indent
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "▏",
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
      -- show_trailing_blankline_indent = false,
      -- show_current_context = false,
      -- space_char_blankline = " ",
      show_current_context = true,
      -- show_current_context_start = true,
      show_end_of_line = true,
    },
  },

  -- comment
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },

  -- auto pairs
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },

  -- search and replace
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files" },
      -- { "<leader>srp", function() require("spectre").open({is_insert_mode=true, path="*.php"}) end, desc = "Replace in PHP files" },
      -- { "<leader>srw", function() require("spectre").open_visual({select_word=true}) end, desc = "Search current word" },
      -- { "<leader>srr", function() require("spectre").open_visual() end, mode = "v", desc = "Search current word" },
    },
    opts = {
      open_cmd = 'vnew',
      -- is_insert_mode = true,
    },
  },

  -- quickfix
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
  },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  }
}
