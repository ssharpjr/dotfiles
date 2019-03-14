#!/usr/bin/env bash

I3CONFIGFILE="$HOME/.config/i3/config"
I3COMMANDSFILE="$HOME/.config/i3/commands.csv"


echo Reading $I3CONFIGFILE ...
cat $I3CONFIGFILE | grep "#_#" | cut -d '#' -f 3 > $I3COMMANDSFILE 
echo Created/Updated $I3COMMANDSFILE
