 xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
xrandr --output eDP-1-1 --mode 2560x1440 --rate 60
# xrandr --output eDP1 --mode 2560x1440 --rate 60
xrandr --dpi 96

exec i3
