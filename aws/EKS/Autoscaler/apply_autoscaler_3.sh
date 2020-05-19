#!/bin/bash

# https://docs.aws.amazon.com/eks/latest/userguide/cluster-autoscaler.html

kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-autodiscover.yaml

kubectl -n kube-system annotate deployment.apps/cluster-autoscaler cluster-autoscaler.kubernetes.io/safe-to-evict="false"

echo "
Edit the cluster-autoscaler container command to replace <YOUR CLUSTER NAME> \
	with your cluster's name, and add the following options. \
    --balance-similar-node-groups \
    --skip-nodes-with-system-pods=false \
"

#kubectl -n kube-system edit deployment.apps/cluster-autoscaler
echo "kubectl -n kube-system edit deployment.apps/cluster-autoscaler"

#kubectl -n kube-system set image deployment.apps/cluster-autoscaler cluster-autoscaler=us.gcr.io/k8s-artifacts-prod/autoscaling/cluster-autoscaler:v1.15.6
echo "kubectl -n kube-system set image deployment.apps/cluster-autoscaler cluster-autoscaler=us.gcr.io/k8s-artifacts-prod/autoscaling/cluster-autoscaler:v1.15.6"

#kubectl -n kube-system logs -f deployment.apps/cluster-autoscaler




