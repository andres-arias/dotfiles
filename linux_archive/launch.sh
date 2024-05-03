#!/usr/bin/env sh

#   ___           __              ___       _
#  / _ | ___  ___/ /______ ___   / _ | ____(_)__ ____
# / __ |/ _ \/ _  / __/ -_|_-<  / __ |/ __/ / _ `(_-<
#/_/ |_/_//_/\_,_/_/  \__/___/ /_/ |_/_/ /_/\_,_/___/
#
# POLYBAR LAUNCH SCRIPT
# ================================================
# LICENSE: USE THIS IF YOU LIKE, YOU CAN CHANGE
# WHATEVER YOU WANT, I DON'T CARE.
# ================================================
#
# I keep this file as documented as possible, so I 
# don't forget what I need, also, if someone else
# finds this useful, they know what they're getting.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar top &
