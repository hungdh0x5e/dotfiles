-- LSP Config
return {
  -- Install LSP server into local
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        -- for golang
        "gopls",
        -- "golangci-lint",

        -- for python
        "pyright",
        "ruff_format",
        "black",
        "isort",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
      -- used for completion, annotations and signatures of Neovim apis
      { "folke/neodev.nvim", opts = {} },

      -- Useful status updates for LSP.
      -- { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()

      local on_attach = function(client, bufnr)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        -- map("<leader>gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        -- map("<leader>gt", vim.lsp.buf.type_definition, "[G]oto [T]ype definition")
        map("<leader>gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
        map("<leader>gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        -- rename function
        map("<leader>ra", function()
          require "nvchad.lsp.renamer"()
        end, "NvRenamer")
        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        map("K", vim.lsp.buf.hover, "Hover Information")
        map("[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("]d", vim.diagnostic.goto_next, "Next diagnostic")

        -- Some keymap useful later
        -- map("<leader>sh", vim.lsp.buf.signature_help, "Show signature help")
        -- map("<leader>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
        -- map("<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")

        -- map("<leader>wl", function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, "List workspace folders")

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
          border = "rounded",
        })

        -- setup signature popup
        if client.server_capabilities.signatureHelpProvider then
          require("nvchad.lsp.signature").setup(client, bufnr)
        end
      end

      -- local on_attach = require("nvchad.configs.lspconfig").on_attach
      -- local on_init = require("nvchad.configs.lspconfig").on_init
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      local lspconfig = require "lspconfig"
      local servers = { "html", "cssls", "pyright" }

      -- lsps with default config
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          on_init = on_init,
          capabilities = capabilities,
        }
      end

      -- typescript
      -- lspconfig.tsserver.setup {
      --   on_attach = on_attach,
      --   on_init = on_init,
      --   capabilities = capabilities,
      -- }

      -- golang
      lspconfig.gopls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = false,
            analyses = {
              unusedparam = true,
            },
          },
        },
      }
    end,
  },
}
