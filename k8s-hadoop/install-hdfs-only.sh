#!/usr/bin/bash -v

#download git repo: https://github.com/apache-spark-on-k8s/kubernetes-HDFS
#TODO: review, is failing

helm repo add incubator https://kubernetes-charts-incubator.storage.googleapis.com

helm dependency build charts/hdfs-k8s

helm install -n my-hdfs charts/hdfs-k8s