local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = "GruvboxDark"
config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular" })
config.font_size = 15.0
config.window_background_opacity = 0.85

-- maximum display for terminal
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.enable_scroll_bar = false
config.window_padding = {
	left = 5,
	right = 0,
	top = 5,
	bottom = 0,
}

config.keys = {
	{ key = "p", mods = "CMD", action = act.SendString("\x01\x28") }, -- tmux previous client
	{ key = "n", mods = "CMD", action = act.SendString("\x01\x29") }, -- tmux next client
	{ key = "j", mods = "CMD", action = act.SendString("\x01\x6a") }, -- tmux next client
}

-- tmux navigating window by index
for idx = 1, 5 do
	table.insert(config.keys, {
		key = tostring(idx),
		mods = "CMD",
		action = act.Multiple({
			act.SendKey({ key = "a", mods = "CTRL" }),
			act.SendKey({ key = tostring(idx) }),
		}),
	})
end

return config
