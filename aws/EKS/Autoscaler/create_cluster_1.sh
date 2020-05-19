#!/bin/bash
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
	--without-nodegroup \
        --tags \"${COMMON_TAGS}\"" 
eksctl create cluster \
	--name ${CLUSTER_NAME} \
        ${AZS_VPCS} \
        --version ${KUBE_VERSION} \
	--without-nodegroup \
        --tags "${COMMON_TAGS}" 
