local opts = {
  labels = "asdfhjklqweruiopzxcvbnm",
  jump = {
    autojump = true,
  },
  modes = {
    char = {
      jump_labels = true,
      highlight = { backdrop = false },
      multi_line = false,
    },
  },
}

require("flash").setup(opts)
