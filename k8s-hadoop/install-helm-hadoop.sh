#!/usr/bin/bash -v

#install a hadoop cluster in k8s with Persistent Volume(PV) 
NUMBER_DATA_NODES=1
#TODO: is not working with more than 1 datanode

SIZE_HDD_DATA_NODES=50Gi

helm install --name hadoop \
  --set persistence.nameNode.enabled=true \
  --set persistence.nameNode.storageClass=default \
  --set persistence.dataNode.enabled=true \
  --set persistence.dataNode.storageClass=default \
  --set persistence.dataNode.size=$SIZE_HDD_DATA_NODES \
  --set hdfs.dataNode.replicas=$NUMBER_DATA_NODES \
  stable/hadoop


