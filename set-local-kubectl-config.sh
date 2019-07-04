#!/usr/bin/env bash

. env.sh

#aws s3 cp $KOPS_STATE_STORE/config ~/.kube/config

unset KUBECONFIG
export KUBECONFIG=$PWD/kubeconfig.yaml
kops export kubecfg --name $KOPS_CLUSTER_NAME --state $KOPS_STATE_STORE  --kubeconfig kubeconfig.yaml
echo $KUBECONFIG


