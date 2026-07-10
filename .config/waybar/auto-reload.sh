while inotifywait -e close_write ~/dotfiles/.config/waybar/config.jsonc; do
    pkill -SIGUSR2 waybar
done