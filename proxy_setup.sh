#!/bin/bash

BASEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
source $BASEDIR/proxy
PROXY_NW=$($BASEDIR/which_nw.sh)

if [ $PROXY_NW -eq '0' ]; then
  echo "Using Proxy Network"
  export http_proxy=$HTTP_PROXY
  export https_proxy=$HTTPS_PROXY
else
  unset http_proxy
  unset https_proxy
fi

alias sudo="sudo http_proxy=$http_proxy https_proxy=$https_proxy"
