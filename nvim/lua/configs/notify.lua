local notify = require "notify"

notify.setup {
  background_colour = "#000000",
  fps = 30,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = "",
  },
  level = 2,
  minimum_width = 50,
  render = "default",
  stages = "fade_in_slide_out", -- fade_in_slide_out, fade, slide, static
  time_formats = {
    notification = "%T",
    notification_history = "%FT%T",
  },
  timeout = 4000,
  top_down = true,
}

vim.notify = notify

vim.notify("Welcome back, hungdh", vim.log.levels.INFO, { title = "Intro" })
