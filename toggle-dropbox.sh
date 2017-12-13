#!/bin/bash
# /Volumes contents changed
# check if Dropbox needs to be killed or restarted
if [ $1 ]; then
    # Volume name provided
    VOLUME=$1
else
    VOLUME="echen"
fi

# Is Dropbox running?
DROPBOX=`pgrep Dropbox | awk '{print $1; exit}'`
MOUNTPOINT=`diskutil info $VOLUME | grep "Mount Point" | awk '{print $3}'`

if [ -z $DROPBOX ]; then
  # Dropbox not running
  if [ $MOUNTPOINT ]; then
    # Volume mounted start Dropbox
        open /Applications/Dropbox.app
  fi
else
  # Dropbox running
  if [ -z $MOUNTPOINT ]; then
    # Volume not mounted, kill Dropbox
    killall Dropbox
  fi
fi
