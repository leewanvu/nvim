return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    local keymaps = {
      mode = { "n", "v" },
      ["g"] = { name = "+goto" },
      ["gz"] = { name = "+surround" },
      ["]"] = { name = "+next" },
      ["["] = { name = "+prev" },
      ["<leader>b"] = { name = "+buffer" },
      ["<leader>c"] = { name = "+code" },
      ["<leader>f"] = { name = "+file/find" },
      ["<leader>g"] = { name = "+git" },
      -- ["<leader>gh"] = { name = "+hunks" },
      ["<leader>s"] = { name = "+search" },
      -- ["<leader>sr"] = { name = "+replace (Spectre)" },
      ["<leader>u"] = { name = "+ui" },
      ["<leader>x"] = { name = "+diagnostics/quickfix" },
    }
    wk.register(keymaps)
  end,
}
