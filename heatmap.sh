#!/usr/bin/env bash
#
# heatmap
#  https://github.com/christianchristensen/heatmap.sh
#
# Heatmaps in your terminal
# (based off sparklines: https://github.com/holman/spark)
#
# Input X:size, Y (inferred/defaulted from X size)

# Generates the heatmap.
#
# $1 - The data we'd like to graph.
_echo()
{
  if [ "X$1" = "X-n" ]; then
    shift
    printf "%s" "$*"
  else
    printf "%s\n" "$*"
  fi
}

heatmap()
{
  local n first=1 width=1 numbers=

  # find min/max values
  local min=0xffffffff max=0

  for n in ${@//,/ }
  do
    # on Linux (or with bash4) we could use `printf %.0f $n` here to
    # round the number but that doesn't work on OS X (bash3) nor does
    # `awk '{printf "%.0f",$1}' <<< $n` work, so just cut it off
    n=${n%.*}
    if [ $first -eq 1 ]; then
      first=0
      width=$n
    else
      (( n < min )) && min=$n
      (( n > max )) && max=$n
      numbers=$numbers${numbers:+ }$n
    fi
  done

  # print ticks
  local ticks=(░ ░ ▒ ▒ ▓ ▓ █ █)

  local f=$(( (($max-$min)<<8)/(${#ticks[@]}-1) ))
  (( f < 1 )) && f=1

  local count=0 returnonlast=0
  for n in $numbers
  do
    returnonlast=0
    _echo -n ${ticks[$(( ((($n-$min)<<8)/$f) ))]}
    # bump line based on x-width
    count=$(( $count+1 ))
    if [ $(($count % $width)) -eq 0 ]; then
      _echo
      returnonlast=1
    fi
  done
  if [ $returnonlast -ne 1 ]; then
    _echo
  fi
}

# If we're being sourced, don't worry about such things
if [ "$BASH_SOURCE" == "$0" ]; then
  # Prints the help text for heatmap.sh.
  help()
  {
    cat <<EOF

    USAGE:
      heatmap.sh [-h|--help] X-WIDTH VALUE,...
       (y "length" is based off the number of values read)

    EXAMPLES:
      heatmap.sh 6 1 3 6 1 8 3 3 5 6 8 5 5
      ░▒▓░█▒
      ▒▓▓█▓▓
EOF
  }

  # show help for no arguments if stdin is a terminal
  if { [ -z "$1" ] && [ -t 0 ] ; } || [ "$1" == '-h' ] || [ "$1" == '--help' ]
  then
    help
    exit 0
  fi

  heatmap ${@:-`cat`}
fi
