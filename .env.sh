#!/usr/bin/env bash

bucket_name=bucket-for-kops-2
cluster_name=test.k8s.local
master_size=t2.medium
workers_count=2
workers_size=t2.medium
aviablity_zone=us-east-1a

#kops env vars
export KOPS_CLUSTER_NAME=$cluster_name
export KOPS_STATE_STORE=s3://${bucket_name}