#!/usr/bin/env bash

#docker login docker hub before execute the script
#docker loging --username $HUBUSER

HUBUSER=raanglada
HADOOP_VERSION=2.9.2

docker build --build-arg HADOOP_VERSION=$HADOOP_VERSION -t $HUBUSER/hadoop-base:$HADOOP_VERSION .

docker-compose build

#tagging
docker tag $HUBUSER/hadoop-namenode $HUBUSER/hadoop-namenode:$HADOOP_VERSION
docker tag $HUBUSER/hadoop-datanode $HUBUSER/hadoop-datanode:$HADOOP_VERSION

#pushing to docker hub
docker push $HUBUSER/hadoop-base:$HADOOP_VERSION
docker push $HUBUSER/hadoop-namenode:$HADOOP_VERSION
docker push $HUBUSER/hadoop-datanode:$HADOOP_VERSION

#testing
docker-compose up -d


