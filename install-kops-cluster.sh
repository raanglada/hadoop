#!/usr/bin/bash -v
#You need aws access granted to execute sucessfully the current script

. envars.sh

#create cluster
kops create cluster \
--master-size=${MASTER_SIZE} \
--node-count=${WORKERS_COUNT} \
--node-size=${WORKERS_SIZE} \
--zones=${AWS_ZONE} \
--name=${KOPS_CLUSTER_NAME}

#TODO
#update kops configs for autoscaling
#create ssh key if not exist or give the custom path

#use existing ssh key
kops create secret --name ${KOPS_CLUSTER_NAME} sshpublickey admin -i ~/.ssh/id_rsa.pub

#execute cluster
kops update cluster --name ${KOPS_CLUSTER_NAME} --yes

#TODO
#wait for cluster ready
#kops validate cluster







