set -euo pipefail

URL=$1

S3_DIR=`dirname $URL | sed 's/^.*\\/\\///' | sed 's/:.*//'`
DATE=`date -u +%Y-%m-%dT%H:%M:%S.%3NZ`
DIR=$DATE

S3_URL='https://rmad-fitnesse-results.s3.amazonaws.com/'
TEST=`basename $URL`

aws ecs run-task \
     --capacity-provider-strategy capacityProvider=FARGATE,weight=1 \
     --cluster FitnesseFargate \
     --task-definition fitnesse-grabber:11 \
     --network-configuration \
     "awsvpcConfiguration=\
         {subnets=[subnet-572af478],\
          securityGroups=[sg-c7b433a2],\
          assignPublicIp=ENABLED}" \
     --overrides \
     "containerOverrides=\
         [{name=fitnesse-grabber,\
           command=[bash,./grab.sh,$URL,$DIR]}]" \
     --count 1 \
     --region us-east-1

echo $S3_URL$DIR/$TEST.html

