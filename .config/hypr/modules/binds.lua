---------------------
---- KEYBINDINGS ----
---------------------

---------------------
---- MY PROGRAMS ----
---------------------
local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"

---------------------
------- Menu --------
---------------------
local menu        = "~/.config/rofi/type-5/launcher.sh"
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal)) --Opening Terminal
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close()) --Closing Window

hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("wlogout"))

-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- FileManager 
hl.bind(mainMod .. " + G", hl.dsp.window.float({ action = "toggle" })) --Enables Floating windows
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo()) -- Makes small 
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
	hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + TAB", hl.dsp.focus({ workspace = "e+1" })) -- Cycling through the Workspaces

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + A",         hl.dsp.workspace.toggle_special("magic")) 
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Resize active window using SUPER + ALT + H/J/K/L
hl.bind("SUPER + ALT + H", hl.dsp.window.resize({x = -40, y= 0}))
hl.bind("SUPER + ALT + K", hl.dsp.window.resize())
hl.bind("SUPER + ALT + J", hl.dsp.window.resize({x = 0, y = 40 }))
hl.bind("SUPER + ALT + L", hl.dsp.window.resize({x = 40, y = 0 }))

---------------------
---- SCREENSHOTS ----
---------------------
-- Capture a selected region (Matches the standard SUPER + SHIFT + S muscle memory)
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- Capture the entire monitor (Mapped to the standard Print Screen key)
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m output"))

-- Capture a specific window
hl.bind("ALT + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))


---------------------
----- CLIPBOARD -----
---------------------
-- Launch the Clipse TUI in a floating Kitty terminal
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu -display-columns 2 | cliphist decode | wl-copy"))