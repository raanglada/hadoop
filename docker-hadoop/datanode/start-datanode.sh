#!/bin/bash

hdfs datanode -format
hdfs datanode

tailf -f /dev/null