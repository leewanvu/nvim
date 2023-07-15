return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    symbols = {
      ---Modification indicator.
      ---
      ---@type string
      modified = "●",

      ---Truncation indicator.
      ---
      ---@type string
      ellipsis = "…",

      ---Entry separator.
      ---
      ---@type string
      separator = "",
    },
    ---@type barbecue.Config.kinds
    -- kinds = {
    --   File = "",
    --   Module = "",
    --   Namespace = "",
    --   Package = "",
    --   Class = "",
    --   Method = "",
    --   Property = "",
    --   Field = "",
    --   Constructor = "襁",
    --   Enum = "練",
    --   Interface = "ﴯ",
    --   Function = "",
    --   Variable = "",
    --   Constant = "ﲀ",
    --   String = "",
    --   Number = "",
    --   Boolean = " ",
    --   Array = "",
    --   Object = "ﴯ",
    --   Key = "",
    --   Null = "ﳠ",
    --   EnumMember = "",
    --   Struct = "",
    --   Event = "",
    --   Operator = "",
    --   TypeParameter = "",
    -- },
    kinds = {
      File          = " ",
      Module        = " ",
      Namespace     = " ",
      Package       = " ",
      Class         = " ",
      Method        = " ",
      Property      = " ",
      Field         = " ",
      Constructor   = " ",
      Enum          = "練",
      Interface     = "練",
      Function      = " ",
      Variable      = " ",
      Constant      = " ",
      String        = " ",
      Number        = " ",
      Boolean       = "◩ ",
      Array         = " ",
      Object        = " ",
      Key           = " ",
      Null          = "ﳠ ",
      EnumMember    = " ",
      Struct        = " ",
      Event         = " ",
      Operator      = " ",
      TypeParameter = " ",
    }
  },
}
