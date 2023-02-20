. ~/.profile

DESKTOP_SESSION=dwm
STATUS_BAR_NOTIFY=false
STATUS_BAR_RESTART_ON_SIGHUP=true
export DESKTOP_SESSION STATUS_BAR_NOTIFY STATUS_BAR_RESTART_ON_SIGHUP
dwm-status-bar &

setxkbmap -layout br -model abnt2 &

monitors="$(xrandr --listmonitors | grep -i monitors | cut -d ' ' -f 2)"
if test ${monitors} = 2; then
	xrandr --output eDP1 --auto --right-of HDMI1
	feh --bg-scale ~/Pictures/backgrounds/nefelibata.jpg ~/Pictures/backgrounds/macaw.jpg &
else
	feh --bg-scale ~/Pictures/backgrounds/nefelibata.jpg &
fi

picom &
dunst -geometry "400x200+5-5" &

MANPATH=/usr/share/man:/usr/X11R7/man:/usr/pkg/man:/usr/local/man
VISUAL=nvim
export MANPATH VISUAL

exec dwm
