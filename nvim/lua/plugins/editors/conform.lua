-- format
return {
  "stevearc/conform.nvim",
  event = { "LspAttach", "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = true,

    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofmt", "goimports_reviser" },
      json = { "jq" },
      yaml = { "yamlfmt" },
      css = { "prettier" },
      html = { "prettier" },
    },

    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true, go = true }

      if disable_filetypes[vim.bo[bufnr].filetype] then
        return
      end

      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,

    formatters = {
      goimports_reviser = {
        command = "goimports-reviser",
        stdin = true,
        inherit = false,
        args = {
          "-company-prefixes",
          "gitlab.id.vin",
          "-project-name",
          "vinshop",
          "-imports-order",
          "std,project,general,company",
          "-rm-unused",
          "-output",
          "stdout",
          "$FILENAME",
        },
      },
    },
  },
}
