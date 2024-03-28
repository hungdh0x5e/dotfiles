local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofmt", "goimports_reviser" },
    json = { "jq" },
    yaml = { "yamlfmt" },
    css = { "prettier" },
    html = { "prettier" },
  },

  -- format_on_save = {
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },

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

require("conform").setup(options)
