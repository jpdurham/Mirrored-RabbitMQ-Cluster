#!/bin/sh
set -x #echo on
# Make sure we have at least 1 parameter
if [ $# -eq 0 ]
then
   echo "Missing argument: <user>@ip-<address>"
   exit 1
fi

# Get the first argument
address = $1

sudo rabbitmqctl stop_app
sudo rabbitmqctl reset
sudo rabbitmqctl join_cluster $address
sudo rabbitmqctl start_app

sudo rabbitmqctl cluster_status

# Set High Availability policy - sync all queues across all nodes
rabbitmqctl set_policy ha-all "" '{"ha-mode":"all", "ha-sync-mode":"automatic"}'