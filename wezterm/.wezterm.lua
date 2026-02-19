------
-- Constants
local GIT_BASH_PATH = 'C:\\Program Files\\Git\\bin\\bash.exe'
local DEFAULT_CWD = 'C:\\Users\\brand\\git_repos'
local COLOR_SCHEME = 'Dracula'
local FONT_SIZE = 12
local FONT_NAME = 'Hack Nerd Font Mono'
------

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = FONT_SIZE
config.font = wezterm.font(FONT_NAME)
config.color_scheme = COLOR_SCHEME

-- Code here will ONLY run if on a Windows machine
if wezterm.target_triple:find("windows") then
    config.default_prog = { GIT_BASH_PATH, '--login', '-i' }
    config.default_cwd = DEFAULT_CWD

    config.launch_menu = {
        {
            label = 'CMD',
            args = { 'cmd.exe' },
        },
        {
            label = 'PowerShell',
            args = { 'powershell.exe', '-NoLogo' },
        },
        {
            label = 'Git Bash',
            args = { GIT_BASH_PATH, '--login', '-i' },
        },
    }
end

-- Blur background on Windows
-- config.win32_system_backdrop = 'Acrylic'
-- config.window_background_opacity = 0.5

config.keys = {
  -- Split horizontally (new pane is on the right)
  {
    key = '|',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Split vertically (new pane is on the bottom)
  {
    key = '_',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },

}

-- Finally, return the configuration to wezterm:
return config
