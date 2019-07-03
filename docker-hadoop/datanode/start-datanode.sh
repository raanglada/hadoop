#!/bin/bash

hdfs datanode -format
hdfs datanode

tail -f /dev/null