#!/bin/bash

hdfs datanode -format
/etc/init.d/ssh start

hadoop-daemon.sh start datanode
yarn-daemon.sh start nodemanager

tail -f /dev/null