#!/bin/bash
WKDIR=$(dirname $0)

source ${WKDIR}/setup

# Delete nodegroups
for az in ${AZ_LIST}
do
  echo "eksctl delete nodegroup --cluster ${CLUSTER_NAME} --name ${az}"
  eksctl delete nodegroup --cluster ${CLUSTER_NAME}  --name ${az}
done

eksctl delete cluster ${CLUSTER_NAME}
