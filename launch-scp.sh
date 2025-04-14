#!/bin/bash

# launch-scp.sh - SCP: Secret Laboratory auto-launch and macro script
# Copyright (C) 2025 Skyshine96
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.

# Creates a log
exec 2>> $HOME/scp_script_errors.log

# Start ydotoold if not already running which is required for the auto keys
if ! pgrep -x "ydotoold" > /dev/null; then
    ydotoold &
    sleep 1  # give it a moment to start
fi

# Launch SCP:SL
steam -applaunch 700330 &

# Wait for the game to load
sleep 23

# Open console (keycode 39 = ö on DE(german) layout)(change the key number to your console key)
ydotool key 39

# Wait for the console to open so it doesnt conflict with the cst command
sleep 0.15

# Type 'cst' and press Enter (the cst command toggles the create server visibility for creating a solo server)
echo "cst" | ydotool type --file -
ydotool key 28  # Enter

# Type 'accstats' and press Enter (the accstats command gives you more information about your bullet spread on the crosshair)
echo "accstats" | ydotool type --file -
ydotool key 28

# Wait for the script to finish typing
sleep 0.1

# Presses the escape key to exit console
ydotool key 1

# Wait to finish
sleep 0.2

# Close ydotoold
pkill ydotool
