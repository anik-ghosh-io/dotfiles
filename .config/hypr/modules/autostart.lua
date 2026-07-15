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
  hl.exec_cmd("hypridle -c ~/.config/hypr/hypridle/hypridle")
  hl.exec_cmd("kdeconnect-indicator &")
end)