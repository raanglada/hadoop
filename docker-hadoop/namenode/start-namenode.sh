#!/bin/bash

ip=$(hostname -i); echo "$ip	namenode" >> /etc/hosts

hdfs namenode -format
/etc/init.d/ssh start

hadoop-daemon.sh start namenode

tail -f /dev/null
