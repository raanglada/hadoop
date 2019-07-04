#!/bin/bash

echo "127.0.0.1    namenode" >> /etc/hosts

hdfs namenode -format
/etc/init.d/ssh start

#$HADOOP_HOME/sbin/start-all.sh

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh
$HADOOP_HOME/sbin/mr-jobhistory-daemon.sh start historyserver

tail -f /dev/null
