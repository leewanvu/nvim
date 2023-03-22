local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "vux.plugins" },
}, {
  ui = {
    icons = {
      cmd = "גּ",
      lazy = "鈴",
      config = "漣",
      event = "",
      ft = "",
      init = "漣",
      import = "",
      keys = "",
      loaded = "●",
      not_loaded = "○",
      plugin = "ﮣ",
      runtime = "",
      source = "",
      start = "",
      task = "",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
