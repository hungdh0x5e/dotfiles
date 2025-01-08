vim.filetype.add {
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    mdx = "mdx",
    log = "log",
    conf = "conf",
    env = "config",
    bru = "ruby",
    zsh = "bash",
  },
  -- Detect and apply filetypes based on the entire filename
  filename = {
    [".env"] = "config",
    ["env"] = "dotenv",
    ["tsconfig.json"] = "jsonc",
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    -- INFO: Match filenames like - ".env.example", ".env.local" and so on
    ["%.env%.[%w_.-]+"] = "config",
    ["Dockerfile[%w_.-]+"] = "dockerfile",
    [".*gitconfig.*"] = "gitconfig",
  },
}
