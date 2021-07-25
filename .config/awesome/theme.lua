--[[
    Cesious Awesome WM theme
    Created by Culinax
    Modified by Thanos Apostolou
--]]

local themes_dir = require("gears.filesystem").get_themes_dir()
local theme_name = "default"
local theme_path = themes_dir .. theme_name .. "/"


theme = {}

theme.font              = "Noto Sans Regular 10"
theme.notification_font = "Noto Sans Bold 14"

nord = {
    dark = { "#2E3440", "#3B4252", "#434C5E", "#4C566A" },
    snow = { "#D8DEE9", "#E5E9F0", "#ECEFF4" },
    frost = { "#8FBCBB", "#88C0D0", "#81A1C1", "#5E81AC" },
    aurora = { "#BF616A", "#D07770", "#EBCB8B", "#A3BE8C", "#B48EAD"}
}

theme.bg_normal   = nord.dark[1]
theme.bg_focus    = nord.dark[4]
theme.bg_urgent   = "#000000"
theme.bg_minimize = "#101010"
-- Opacity doesn't work there, so just mimic visual appearence
theme.bg_systray  = "#2e3440"

theme.fg_normal   = "#ffffff"
theme.fg_focus    = "#ffffff"
theme.fg_urgent   = "#ff0000"
theme.fg_minimize = "#ffffff"

theme.border_width  = 2
theme.border_normal = "#000000"
theme.border_focus  = nord.aurora[2]
theme.border_marked = nord.aurora[2]

theme.useless_gap = 4

theme.hotkeys_modifiers_fg = "#2EB398"

-- Taskbar settings
theme.wibar_bg    = theme.bg_normal
theme.tb_height = 40
-- Taglist
theme.taglist_font = "noto Sans Regular 6"
theme.taglist_bg_empty = "#00000000"
theme.taglist_fg_empty = "#666"
theme.taglist_bg_occupied = nord.dark[2] 
theme.taglist_bg_focus = theme.bg_focus 
theme.taglist_bg_urgent = nord.aurora[1]
-- Tasklist
theme.tasklist_bg_normal = nord.dark[2] --"#00000000"
theme.tasklist_bg_minimize = "#00000000"
theme.tasklist_bg_focus = nord.dark[4]
theme.tasklist_bg_urgent = nord.aurora[1]

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = theme_path .. "taglist/squarefw.png"
theme.taglist_squares_unsel = theme_path .. "taglist/squarew.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = theme_path .. "icons/submenu.png"
theme.menu_height = 25
theme.menu_width  = 200

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal              = theme_path .. "titlebar/close_normal_arc.png"
theme.titlebar_close_button_focus               = theme_path .. "titlebar/close_focus_arc.png"

theme.titlebar_ontop_button_normal_inactive     = theme_path .. "titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme_path .. "titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme_path .. "titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme_path .. "titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive    = theme_path .. "titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme_path .. "titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme_path .. "titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme_path .. "titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive  = theme_path .. "titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme_path .. "titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme_path .. "titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme_path .. "titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = theme_path .. "titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme_path .. "titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme_path .. "titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme_path .. "titlebar/maximized_focus_active.png"

theme.wallpaper = "/home/garrus/pictures/wallpapers/wallpaper_5.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh      = theme_path .. "layouts/fairh.png"
theme.layout_fairv      = theme_path .. "layouts/fairv.png"
theme.layout_floating   = theme_path .. "layouts/floating.png"
theme.layout_magnifier  = theme_path .. "layouts/magnifier.png"
theme.layout_max        = theme_path .. "layouts/max.png"
theme.layout_fullscreen = theme_path .. "layouts/fullscreen.png"
theme.layout_tilebottom = theme_path .. "layouts/tilebottom.png"
theme.layout_tileleft   = theme_path .. "layouts/tileleft.png"
theme.layout_tile       = theme_path .. "layouts/tile.png"
theme.layout_tiletop    = theme_path .. "layouts/tiletop.png"
theme.layout_spiral     = theme_path .. "layouts/spiral.png"
theme.layout_dwindle    = theme_path .. "layouts/dwindle.png"
theme.layout_cornernw   = theme_path .. "layouts/cornernw.png"
theme.layout_cornerne   = theme_path .. "layouts/cornerne.png"
theme.layout_cornersw   = theme_path .. "layouts/cornersw.png"
theme.layout_cornerse   = theme_path .. "layouts/cornerse.png"

theme.awesome_icon = theme_path .. "icons/manjaro64.png"

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = "breeze"

return theme
