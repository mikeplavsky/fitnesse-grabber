set -euo pipefail

URL=$1

aws ecs run-task \
     --capacity-provider-strategy capacityProvider=FARGATE,weight=1 \
     --cluster FitnesseFargate \
     --task-definition fitnesse-grabber:9 \
     --network-configuration \
     "awsvpcConfiguration=\
         {subnets=[subnet-572af478],\
          securityGroups=[sg-c7b433a2],\
          assignPublicIp=ENABLED}" \
     --overrides \
     "containerOverrides=\
         [{name=fitnesse-grabber,\
           command=[bash,./grab.sh,$URL]}]" \
     --count 1 \
     --region us-east-1
