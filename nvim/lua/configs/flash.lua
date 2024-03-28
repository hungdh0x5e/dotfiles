local opts = {
  jump = {
    autojump = true,
  },
  modes = {
    char = {
      enable = false,
      jump_labels = true,
      highlight = { backdrop = false },
    },
  },
}

require("flash").setup(opts)
