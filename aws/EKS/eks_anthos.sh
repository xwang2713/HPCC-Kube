#!/bin/bash
################################################################################
#    HPCC SYSTEMS software Copyright (C) 2019 HPCC Systems®   .
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
################################################################################

# [✖]  AWS::EKS::Cluster/ControlPlane: CREATE_FAILED – "Cannot create cluster 'hpcc1' because us-east-1e, the targeted availability zone, does not currently have sufficient capacity to support the cluster. Retry and choose from these availability zones: us-east-1a, us-east-1b, us-east-1c, us-east-1d, us-east-1f (Service: AmazonEKS; Status Code: 400; Error Code: UnsupportedAvailabilityZoneException; Request ID: 94324754-4460-4e06-941a-26553c3c23a0)"
#us-east-1a us-east-1b us-east-1c us-east-1d but not us-east-1e
export KUBE_ZONE=us-east-1b
export KUBE_ZONE2=us-east-1c
ZONE1=us-east-1a
VPC_PUB_SUBNET1=subnet-05a2f12b
ZONE2=us-east-1b
VPC_PUB_SUBNET2=subnet-9e08ecd3
ZONE3=us-east-1c
VPC_PUB_SUBNET3=subnet-eaacfdb6
ZONE4=us-east-1d
VPC_PUB_SUBNET4=subnet-7b72261c
ZONE5=us-east-1e
VPC_PUB_SUBNET5=subnet-b836ae86
ZONE6=us-east-1f
VPC_PUB_SUBNET6=subnet-33d7d93c

eksctl create cluster \
	--name eks-hpcc-3 \
	--version 1.16 \
	--region us-east-1 \
	--nodegroup-name standard-workers \
	--node-type m4.2xlarge \
	--nodes 4 \
	--nodes-min 4 \
	--nodes-max 10 \
	--node-volume-size 100 \
	--node-ami auto \
	--vpc-public-subnets ${VPC_PUB_SUBNET3} \
	--vpc-public-subnets ${VPC_PUB_SUBNET6} \
	--node-security-groups sg-397a1a62 \
	--tags "application=hpccsystems,lifecycle=dev,market=research,bu=development" \
	--tags "name=EKS cluster,owner_email=xiaoming.wang@lexisnexis.com" \
	--tags "support_email=xiaoming.wang@lexisnexis.com" \
	--tags "product=hpccsystems,project=research ,service=eks,application_owner=HPCCPlatformTeam"

# these two subnets works
#--vpc-public-subnets subnet-eaacfdb6 \
#--vpc-public-subnets subnet-9e08ecd3 \

#--node-security-groups strings
# --region us-east-1 \
# vpc setting can co-existi with zones settings
