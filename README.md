# NGX-App-ECS-CFN

## Introduction
This Task Deploys Nginx Docker container to ECS via CloudFormation and Builds CloudFormation Stack i.e. Deploys to AWS via CI/CD using too Drone CI. 
Following is the pictorial representation of the task
![HighLevelDesign](https://github.com/ChaturvediSulabh/app-docker-ecs-cfn/blob/master/resources/images/new-designer.png)


# How does I test It ?
- Fork this repo 
- Create a free account on [DroneCloud](https://cloud.drone.io) using your GitHub Account
- Activate your forked repo (You will see an option to Activate, against all the repos Drone has been provided access to)
- Repositories -> < YOUR_FORKED_REPO >->Settings
- Add Secret as follows
	- AWS_ACCESS_KEY - < YOUR ACCESS KEY >
	- AWS_SECRET_KEY - < YOUR SECRET KEY >
    - Here, AWS_ACCESS_KEY and AWS_SECRET_KEY are the secret names, make sure the names are as is, if not find these names in .drone.yml file in the root repo and replace it with whatever you would prefer.
 - That's it, this Pipeline will do all the heavy lifting.
 **NOTE: The Stack uses my Hosted Zone "iamsulabh.com", and it creates a CNAME Record mapped to ELB DNS NAME. So, my app is available at, http://ecs-app.iamsulabh.com. However, this will not work for you, so, you can just test as http://<YOUR_ELB_DNS_NAME (You can get ELB DNS NAME from EC2 Service -> Load Balancers).**

Below Image, depicts Nginx accesssible from ELB on Port 80.
![nginx-elb-80](https://github.com/ChaturvediSulabh/app-docker-ecs-cfn/blob/master/resources/images/Screenshot%202019-03-19%20at%2011.16.59%20PM.png)
