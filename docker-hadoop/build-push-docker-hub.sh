!#/usr/bin/env bash

HUBUSER=raanglada
HADOOP_VERSION=2.9.2


docker build --build-arg HADOOP_VERSION=$HADOOP_VERSION -t $HUBUSER/hadoop-base:$HADOOP_VERSION .

#docker build -f nn-rm/Dockerfile -t $HUBUSER/hadoop-namenode --build-args HADOOP_VERSION=$HADOOP_VERSION .

#docker build -f datanode/Dockerfile -t $HUBUSER/hadoop-datanode --build-args HADOOP_VERSION=$HADOOP_VERSION .

#TODO docker loing to docker hub

# docker push $HUBUSER/hadoop-base

# docker push $HUBUSER/hadoop-namenode

# docker push $HUBUSER/hadoop-datanode





