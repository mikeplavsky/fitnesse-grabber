aws ecs run-task \
     --capacity-provider-strategy capacityProvider=FARGATE,weight=1 \
     --cluster FitnesseFargate \
     --task-definition fitnesse-grabber:5 \
     --network-configuration \
     "awsvpcConfiguration={subnets=[subnet-572af478],securityGroups=[sg-c7b433a2],assignPublicIp=ENABLED}" \
     --count 1 \
     --region us-east-1
