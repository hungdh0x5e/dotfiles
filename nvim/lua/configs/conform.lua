local options = {
  notify_on_error = true,

  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofmt", "goimports_reviser" },
    json = { "jq" },
    yaml = { "yamlfmt" },
    css = { "prettier" },
    html = { "prettier" },
  },

  format_on_save = function(bufnr)
    local disable_filetypes = { c = true, cpp = true }
    return {
      timeout_ms = 500,
      lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    }
  end,

  formatters = {
    goimports = {
      args = { "-local", "vinshop" },
    },
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
        "-output",
        "stdout",
        "$FILENAME",
      },
    },
  },
}

return options
