import boto3
ecs = boto3.client('ecs')

def lambda_main(url, dir):

   ecs.run_task(

       capacityProviderStrategy = [dict(
           capacityProvider='FARGATE',
           weight=1
       )],

       cluster="FitnesseFargate",
       count=1,

       networkConfiguration=dict(
           awsvpcConfiguration=dict(
               subnets=['subnet-572af478'],
               securityGroups=['sg-c7b433a2'],
               assignPublicIp='ENABLED'
           )),

       taskDefinition="fitnesse-grabber:11",

       overrides=dict(
           containerOverrides=[dict(
               name="fitnesse-grabber",
               command=["bash","./grab.sh", url, dir])])) 

if __name__ == "__main__":

    from sys import argv, exit
    print(argv)

    if len(argv) < 3:
        print(f'Need URL and DIR')
        exit(-1)

    lambda_main(argv[1], argv[2])


