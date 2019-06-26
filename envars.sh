
#!/usr/bin/bash

S3_BUKET_NAME=ang-kops-bucket
MASTER_SIZE=t2.medium
WORKERS_SIZE=t2.medium
WORKERS_COUNT=3
AWS_ZONE=us-east-1a
CLUSTER_NAME=ang.k8s.local

#export env vars needed by kops
export KOPS_CLUSTER_NAME=${CLUSTER_NAME}
export KOPS_STATE_STORE=s3://${S3_BUKET_NAME}
