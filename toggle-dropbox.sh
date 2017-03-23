#
#      toggle-dropbox
#
#      Copyright (c) 2016 Edward Chen
#
#      toggle-dropbox.sh - start / stop Dropbox agent
#
#      This program is free software: you can redistribute it and/or modify
#      it under the terms of the GNU General Public License as published by
#      the Free Software Foundation, either version 3 of the License, or
#      (at your option) any later version.
#
#      This program is distributed in the hope that it will be useful,
#      but WITHOUT ANY WARRANTY; without even the implied warranty of
#      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#      GNU General Public License for more details.
#
#      You should have received a copy of the GNU General Public License
#      along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#!/bin/bash

if [ $1 ]; then
    # Volume name provided
    VOLUME=$1
else
    echo "Usage: toggle-dropbox.sh [volume name]"
    exit 0
fi

# Is Dropbox running?
DROPBOX=`pgrep Dropbox`
MOUNTPOINT=`diskutil info $VOLUME | grep "Mount Point" | awk '{print $3}'`

# Is SD Card Mounted
if [ $MOUNTPOINT ]; then
    # $MOUNTPOINT mounted
    if [ $DROPBOX ]; then
        # Dropbox is Running - Stop Dropbox
        killall Dropbox
    fi
    # Restart Dropbox
    open /Applications/Dropbox.app
else
    # $MOUNTPOINT unmounted
    if [ $DROPBOX ]; then
     # Dropbox running - Stop Dropbox
     killall Dropbox
    fi
fi
