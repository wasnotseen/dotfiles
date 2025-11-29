selected=$(cliphist list | rofi -dmenu -i -p "Clipboard History")

if [ -n "$selected" ]; then
  cliphist decode <<< "$selected" | wl-copy
fi