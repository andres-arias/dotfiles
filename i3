#   ___           __              ___       _
#  / _ | ___  ___/ /______ ___   / _ | ____(_)__ ____
# / __ |/ _ \/ _  / __/ -_|_-<  / __ |/ __/ / _ `(_-<
#/_/ |_/_//_/\_,_/_/  \__/___/ /_/ |_/_/ /_/\_,_/___/
#
# MY PERSONAL I3WM CONFIGURATION FILE.
# ================================================
# LICENSE: USE THIS IF YOU LIKE, YOU CAN CHANGE
# WHATEVER YOU WANT, I DON'T CARE.
# ================================================
#
# I keep this file as documented as possible, so I 
# don't forget what I need, also, if someone else
# finds this useful, they know what they're getting.

# ==== WORKSPACES ====
set $ws1 ""
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# ==== KEYBINDINGS ====
# Uses super key as action key
set $mod Mod4

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec termite

# kill focused window
bindsym $mod+Shift+q kill

# start rofi with base16 default dark theme (a program launcher)
bindsym $mod+d exec rofi -theme base16-default-dark -show run

# change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"

# Keyboard volume controls
bindsym XF86AudioRaiseVolume exec amixer set Master 5%+ #increase sound volume
bindsym XF86AudioLowerVolume exec amixer set Master 5%- #decrease sound volume
bindsym XF86AudioMute exec amixer -D pulse set Master 1+ toggle # mute sound
# ==== COLORS AND UI ====

# System wide fonts.
font pango:Noto Sans 9

# Base 16 default colorscheme
# Author: Chris Kempson (http://chriskempson.com)
set $base00 #181818
set $base01 #282828
set $base02 #383838
set $base03 #585858
set $base04 #b8b8b8
set $base05 #d8d8d8
set $base06 #e8e8e8
set $base07 #f8f8f8
set $base08 #ab4642
set $base09 #dc9656
set $base0A #f7ca88
set $base0B #a1b56c
set $base0C #86c1b9
set $base0D #7cafc2
set $base0E #ba8baf
set $base0F #a16946

# Executes Polybar
exec_always --no-startup-id $HOME/.config/polybar/launch.sh

# Basic color configuration using the Base16 variables for windows and borders.
# Property Name         Border  BG      Text    Indicator Child Border
client.focused          $base05 $base0D $base00 $base0D $base0D
client.focused_inactive $base01 $base01 $base05 $base03 $base01
client.unfocused        $base01 $base00 $base05 $base01 $base01
client.urgent           $base08 $base08 $base00 $base08 $base08
client.placeholder      $base00 $base00 $base05 $base00 $base00
client.background       $base07

# Removes window titles and adds gaps
for_window [class=".*"] border pixel 2
gaps inner 8
gaps outer 0

# ==== AUTO START PROGRAMS ====
# Runs the compositor:
exec_always compton -b -f -c -r 3 -l -4 -t -4 --shadow-exclude '_GTK_FRAME_EXTENTS@:c'
# Places the wallpaper:
exec_always feh --bg-scale /home/andres/Pictures/Wallpapers/nyc.jpg
# Configures touchpad driver for normal use:
exec_always synclient PalmDetect=1 # Disables touchpad while typing.
exec_always synclient TapButton1=1 # Tap to click
exec_always synclient TapButton2=3 # Tap with 2 fingers for right click
exec_always synclient TapButton3=2 # Tap with 3 fingers for middle click.
exec_always synclient VertScrollDelta=-111 # Inverts horizontal scrollinInverts horizontal scrolling

