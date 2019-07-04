#!/usr/bin/env bash

HUBUSER=raanglada
HADOOP_VERSION=2.9.2

docker build --build-arg HADOOP_VERSION=$HADOOP_VERSION -t $HUBUSER/hadoop-base:$HADOOP_VERSION .

docker-compose build
docker-compose up -d

#docker login docker hub
#docker loging --username=$HUBUSER --password:xxxxxxxx

#tagging
docker tag $HUBUSER/hadoop-namenode $HUBUSER/hadoop-namenode:$HADOOP_VERSION
docker tag $HUBUSER/hadoop-datanode $HUBUSER/hadoop-datanode:$HADOOP_VERSION

#pushing to docker hub
docker push $HUBUSER/hadoop-base:$HADOOP_VERSION
docker push $HUBUSER/hadoop-namenode:$HADOOP_VERSION
docker push $HUBUSER/hadoop-datanode:$HADOOP_VERSION




