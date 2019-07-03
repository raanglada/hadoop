#!/usr/bin/env bash

HUBUSER=raanglada
HADOOP_VERSION=2.9.2
#HDFS_PATH_TO_DATA=/hdfs/data

docker build --build-arg HADOOP_VERSION=$HADOOP_VERSION -t $HUBUSER/hadoop-base:$HADOOP_VERSION .

docker-compose build
docker-compose up -d


#docker build -f nn-rm/Dockerfile -t $HUBUSER/hadoop-namenode:$HADOOP_VERSION .
#docker build -f nn-rm/Dockerfile -t $HUBUSER/hadoop-namenode --build-args HDFS_PATH_TO_DATA=$HDFS_PATH_TO_DATA .

#docker build -f datanode/Dockerfile -t $HUBUSER/hadoop-datanode:$HADOOP_VERSION .
#docker build -f datanode/Dockerfile -t $HUBUSER/hadoop-datanode --build-args HDFS_PATH_TO_DATA=$HDFS_PATH_TO_DATA .

#TODO docker loing to docker hub

# docker push $HUBUSER/hadoop-base

# docker push $HUBUSER/hadoop-namenode

# docker push $HUBUSER/hadoop-datanode





