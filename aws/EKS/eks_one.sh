NODE_TYPE="--node-type t2.micro"
#NODE_TYPE=""
AZ="--zones us-east-1a --zones us-east-1b"
PROFILE="--profile ming"
eksctl create cluster --name single-node-ming --version 1.15 --managed --asg-access ${NODE_TYPE} ${AZ} ${PROFILE}
