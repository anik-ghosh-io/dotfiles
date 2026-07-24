-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi"

hl.on("hyprland.start", function () 
	hl.exec_cmd(terminal)
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd("swaync")
	hl.exec_cmd("kdeconnect-indicator &")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)