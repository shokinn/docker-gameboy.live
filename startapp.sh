#!/bin/sh
# -x	Print a trace of simple commands and their arguments
#		after they are expanded and before they are executed. -o xtrace
# -e	Exit immediately if a simple command exits with a non-zero status, unless
#		the command that fails is part of an until or  while loop, part of an
#		if statement, part of a && or || list, or if the command's return status
#		is being inverted using !.  -o errexit
# -f	Disable file name generation (globbing).  -o noglob
# -u	Treat unset variables as an error when performing 
#		parameter expansion. An error message will be written 
#		to the standard error, and a non-interactive shell will exit. -o nounset
set -xefu

GAMELIST='/data/gamelist.json'
if [ ! -f "$GAMELIST" ]; then
	echo -e "No 'gamelist.json' found.\nExeting now."
	exit 1
fi

/usr/bin/gbdotlive -s -c "$GAMELIST"