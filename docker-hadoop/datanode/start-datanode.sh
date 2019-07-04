#!/bin/bash

hdfs datanode -format
#hdfs datanode

hadoop-daemon.sh start datanode
yarn-daemon.sh start nodemanager

tail -f /dev/null