return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      -- { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    ---@param opts PluginLspOpts
    config = function(_, opts)
      -- diagnostics
      local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "1" },
      }

      for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
      end
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      })

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Global mappings.
          -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
          -- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
          -- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
          -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

          local Util = require("vux.util")
          local buffer = ev.buf
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local keymaps = {
            -- { "<leader>cd", vim.diagnostic.open_float, desc = "Line Diagnostics" },
            -- { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
            { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition", has = "definition" },
            { "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
            { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
            { "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
            { "gt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto Type Definition" },
            { "K", vim.lsp.buf.hover, desc = "Hover" },
            { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
            { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
            { "]d", Util.diagnostic_goto(true), desc = "Next Diagnostic" },
            { "[d", Util.diagnostic_goto(false), desc = "Prev Diagnostic" },
            { "[e", Util.diagnostic_goto(false, "ERROR"), desc = "Prev Error" },
            { "]e", Util.diagnostic_goto(true, "ERROR"), desc = "Next Error" },
            { "]w", Util.diagnostic_goto(true, "WARN"), desc = "Next Warning" },
            { "[w", Util.diagnostic_goto(false, "WARN"), desc = "Prev Warning" },
            {
              "<leader>cf",
              function()
                vim.lsp.buf.format({
                  async = true
                })
              end,
              desc = "Format"
            },
            -- { "<leader>cf", format, desc = "Format Document", has = "documentFormatting" },
            -- { "<leader>cf", format, desc = "Format Range", mode = "v", has = "documentRangeFormatting" },
            { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
            {
              "<leader>cA",
              function()
                vim.lsp.buf.code_action({
                  context = {
                    only = {
                      "source",
                    },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Source Action",
              has = "codeAction",
            }
          }

          local Keys = require("lazy.core.handler.keys")
          -- for _, value in ipairs(keymaps) do
          --   local keys = Keys.parse(value)
          --   if keys[2] == vim.NIL or keys[2] == false then
          --     keymaps[keys.id] = nil
          --   else
          --     keymaps[keys.id] = keys
          --   end
          -- end
          for _, keys in pairs(keymaps) do
            if not keys.has or client.server_capabilities[keys.has .. "Provider"] then
              local opts = Keys.opts(keys)
              opts.has = nil
              opts.silent = opts.silent ~= false
              opts.buffer = buffer
              vim.keymap.set(keys.mode or "n", keys[1], keys[2], opts)
            end
          end
        end,
      })

      -- servers
      local servers = {
        intelephense = {},
      }

      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      -- Setup mason so it can manage external tooling
      require('mason').setup()

      -- Ensure the servers above are installed
      local mason_lspconfig = require 'mason-lspconfig'

      mason_lspconfig.setup {
        ensure_installed = vim.tbl_keys(servers),
      }

      mason_lspconfig.setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            settings = servers[server_name],
          }
        end,
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    -- opts = {
    --   ensure_installed = {
    --     "intelephense",
    --   },
    -- },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      -- local mr = require("mason-registry")
      -- for _, tool in ipairs(opts.ensure_installed) do
      --   local p = mr.get_package(tool)
      --   if not p:is_installed() then
      --     p:install()
      --   end
      -- end
    end,
  },
}
