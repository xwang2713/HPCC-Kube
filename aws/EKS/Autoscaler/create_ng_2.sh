#!/bin/bash
WKDIR=$(dirname $0)

source ${WKDIR}/setup

# Default m5.large (2 cpu, 8 GB mem)
#--node-type=
for az in ${AZ_LIST}
do
echo "eksctl create nodegroup --cluster ${CLUSTER_NAME} \
	--node-zones ${az} --name ${az} --asg-access --managed \
	--nodes-min ${NODES_MIN_NUM} \
       	--nodes ${NODES_START_NUM} \
        --node-type ${NODE_TYPE} \
       	--nodes-max ${NODES_MAX_NUM} \
	--node-security-groups ${SECURITY_GROUPS} \
	--tags \"${COMMON_TAGS}\""
  eksctl create nodegroup --cluster ${CLUSTER_NAME} \
	--node-zones ${az} --name ${az} --asg-access --managed \
        --node-type ${NODE_TYPE} \
	--nodes-min ${NODES_MIN_NUM} \
       	--nodes ${NODES_START_NUM} \
       	--nodes-max ${NODES_MAX_NUM} \
	--tags "${COMMON_TAGS}"
done

