# Modify /etc/yum.repos.d/epel.repo. Under the section marked [epel], change enabled=0 to enabled=1.

sudo yum -qy install erlang --enablerepo=epel

wget http://www.rabbitmq.com/releases/rabbitmq-server/v3.6.3/rabbitmq-server-3.6.3-1.noarch.rpm

sudo rpm -Uvh rabbitmq-server-3.6.3-1.noarch.rpm

sudo rabbitmq-plugins enable rabbitmq_web_stomp

# Enable managament plugin
sudo rabbitmq-plugins enable rabbitmq_management