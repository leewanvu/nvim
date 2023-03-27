local M = {}

function M.find_files()
  return function()
    local opts = require("telescope.themes").get_dropdown()

    opts.find_command = {
      "rg",
      "--files",
      "--hidden",
      "--no-ignore-vcs",
      "-g",
      "!{node_modules,.git,vendor}",
    }
    opts.previewer = false
    opts.prompt_title = false

    opts.path_display = function(opts, path)
      local tail = require("telescope.utils").path_tail(path)
      return string.format("%s (%s)", tail, path)
    end

    require("telescope.builtin").find_files(opts)
  end
end

function M.diagnostic_goto(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end

return M
