-- function for Golang
return {
  "olexsmir/gopher.nvim",
  ft = "go",
  opts = {
    gotests = {
      template = "testify",
    },
  },
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
}
