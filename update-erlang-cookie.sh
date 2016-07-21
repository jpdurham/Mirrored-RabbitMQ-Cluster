#!/bin/sh
set -x #echo on
# Make sure we have at least 1 parameter
if [ $# -eq 0 ]
then
   echo "Missing argument: Erlang cookie"
   exit 1
fi

# Get the first argument
cookie = $1
destdir = /var/lib/rabbitmq/.erlang.cookie

service rabbitmq-server stop

if [ -f "$destdir" ]
then
   echo "$cookie" > "$destdir"
fi

service rabbitmq-server start