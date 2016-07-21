#!/bin/sh
cat <<EOF > /etc/apt/sources.list.d/rabbitmq.list
deb http://www.rabbitmq.com/debian/ testing main
EOF

curl https://www.rabbitmq.com/rabbitmq-release-signing-key.asc -o /tmp/rabbitmq-release-signing-key.asc
apt-key add /tmp/rabbitmq-release-signing-key.asc
rm /tmp/rabbitmq-release-signing-key.asc

apt-get -qy update
apt-get -qy install rabbitmq-server

# Clock synchronization managment configuration
apt-get -qy install ntp
rm -rf /etc/localtime
ln -sf /usr/share/zoneinfo/GMT /etc/localtime

# Enable Web STOMP
rabbitmq-plugins enable rabbitmq_web_stomp

./get-erlang-cookie
