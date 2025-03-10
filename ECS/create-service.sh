aws ecs create-service \
  --cluster fargate-cluster \
  --service-name fargate-service \
  --task-definition sample-fargate:1 \
  --desired-count 1 \
  --launch-type "FARGATE" \
  --network-configuration "awsvpcConfiguration={subnets=[subnet-abcd1234],securityGroups=[sg-abcd1234],assignPublicIp=ENABLED}"
