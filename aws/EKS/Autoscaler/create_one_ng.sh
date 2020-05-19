#!/bin/bash
# This configuration by default will use default VPC and security group.
# Tested with EFS which is on default VPC and subnets also.
# Make sure security group inbound rules for nfs covers subnets used by the EKS cluster 

WKDIR=$(dirname $0)

source ${WKDIR}/setup

AZS_VPCS=""
if [ "${USE_VPC}" = "true" ]
then
  for i in ${VPC_LIST}
  do
    [ -n "$i" ] && AZS_VPCS="$AZS_VPCS --vpc-public-subnets $i"
  done
else
  for i in ${AZ_LIST}
  do
    [ -n "$i" ] && AZS_VPCS="$AZS_VPCS --zones $i"
  done
fi

#       --zones ${KUBE_ZONE1} --zones ${KUBE_ZONE2} \
echo "eksctl create cluster \
	--name ${CLUSTER_NAME} \
        ${AZS_VPCS} \
        --version ${KUBE_VERSION} \
	--managed --asg-access \
        --tags \"${COMMON_TAGS}\"" 
eksctl create cluster \
	--name ${CLUSTER_NAME} \
        ${AZS_VPCS} \
	--managed --asg-access \
        --version ${KUBE_VERSION} \
        --tags "${COMMON_TAGS}" 

