#!/bin/bash

BASEDIR=$(dirname $0)
NETWORKS=(`cat "$BASEDIR/blacklist"`)
current_network=$(nmcli dev wifi | grep \* | tail -1 | awk '{ print $2 }')

if [[ $current_network == ""  ]]; then
  echo 1
elif [[ ${NETWORKS[@]} =~ $current_network  ]]; then
  echo 0
else
  echo 1
fi
