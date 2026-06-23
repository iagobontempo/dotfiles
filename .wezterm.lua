-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

--[[wezterm.on('gui-startup', function(cmd)]]
--[[local tab, pane, window = mux.spawn_window(cmd or {})]]
--[[pane:split { size = 0.7 }]]
--[[end)]]

-- CONFIG
local config = wezterm.config_builder()
config.font = wezterm.font {
    family = 'Monospace',
    weight = 'Regular',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
}

config.freetype_load_target = "Light"
config.font_size = 11.25
config.enable_tab_bar = false
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 2,
}
config.window_background_opacity = 0.8

config.colors = {
    foreground = '#e3c7fc',
    background = '#09090d',

    cursor_bg = '#52ad70',
    cursor_border = '#52ad70',
    cursor_fg = 'black',

    selection_fg = 'black',
    selection_bg = '#fffacd',

    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = '#222222',

    -- The color of the split lines between panes
    split = '#444444',

    ansi = {
        '#140a1d', --black
        '#B52A5B', --maroon
        '#FF4971', --green
        '8897F4', --olive
        'bd93f9', --navy
        'E9729D', --purple
        '#bd93f9', --teal
        '#f1c4e0', --silver
    },
    brights = {
        'grey', --grey
        '#B52A5B', --red
        '#FF4971', --lime
        'yellow', --yellow
        '#BD93F9', --blue
        '#F18FB0', --fuchsia
        '#F18FB0', --aqua
        '#f1c4e0', --white
    },

    -- Arbitrary colors of the palette in the range from 16 to 255
    indexed = { [136] = '#af8700' },

    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    compose_cursor = 'orange',

    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = '#000000' },
    -- use `AnsiColor` to specify one of the ansi color palette values
    -- (index 0-15) using one of the names "Black", "Maroon", "Green",
    --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
    -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
    copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
    copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
    copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

    quick_select_label_bg = { Color = 'peru' },
    quick_select_label_fg = { Color = '#ffffff' },
    quick_select_match_bg = { AnsiColor = 'Navy' },
    quick_select_match_fg = { Color = '#ffffff' },
}

return config
