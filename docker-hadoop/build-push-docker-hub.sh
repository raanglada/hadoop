#!/usr/bin/env bash

HUBUSER=raanglada
HADOOP_VERSION=2.9.2

docker build --build-arg HADOOP_VERSION=$HADOOP_VERSION -t $HUBUSER/hadoop-base:$HADOOP_VERSION .

docker-compose build
docker-compose up -d


#docker build -f nn-rm/Dockerfile -t $HUBUSER/hadoop-namenode:$HADOOP_VERSION .
#docker build -f nn-rm/Dockerfile -t $HUBUSER/hadoop-namenode --build-args HDFS_PATH_TO_DATA=$HDFS_PATH_TO_DATA .

#docker build -f datanode/Dockerfile -t $HUBUSER/hadoop-datanode:$HADOOP_VERSION .
#docker build -f datanode/Dockerfile -t $HUBUSER/hadoop-datanode --build-args HDFS_PATH_TO_DATA=$HDFS_PATH_TO_DATA .

#TODO docker login docker hub

#docker loging --username=$HUBUSER --password:xxxxxxxx

# docker push $HUBUSER/hadoop-base:$HADOOP_VERSION

# docker push $HUBUSER/hadoop-namenode:$HADOOP_VERSION

# docker push $HUBUSER/hadoop-datanode:$HADOOP_VERSION





