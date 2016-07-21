Setting up a mirrored RabbitMQ cluster

Linux AMI 2015.03.0 x86_64 HVM GP2, Amazon Linux, Img Size 8GB, 2CPUs, ~couple GB swap space
Create a security group for RabbitMQ, "rabbit"
 * All TCP should be allowed from itself
 * Custom TCP 5672 port allowed from security group on app server
 * (optional) Custom TCP15672 port allowed for any specific ips you'll use to login to RabbitMQ

Once the security groups have been set up
 * Run rabbitmq-user-data.sh on the master node
 * Run get-erlang-cookie on the master node and copy/write down the cookie
 * Run rabbitmq-user-data.sh on the slave node
 * Run update-erlang-cookie on slave using the cookie from #2
 * Run add-slave-to-cluster on slave with <securityGroup>@ip-<awsIP>
 * Setup Nginx or an internal ELB to handle failovers
 * Healthcheck: ping target: TCP : 5672

Files:
 * rabbitmq-user-data.sh
 * get-erlang-cookie.sh
 * update-erlang-cookie.sh
 * add-slave-to-cluster.sh