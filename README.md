
# NGX-APP-ECS-CFN

## Introduction
This Task Deploys Nginx Docker container to ECS via `CloudFormation` and Builds CloudFormation Stack i.e. Deploys to AWS via one push CI/CD using tool called `Drone CI`. 
Following is the pictorial representation of the task
![HighLevelDesign](https://github.com/ChaturvediSulabh/app-docker-ecs-cfn/blob/master/resources/images/new-designer.png)


# How do I make it work ?
- Fork this repo 
- Create a free account on [DroneCloud](https://cloud.drone.io) using your GitHub Account
- Activate your forked repo (You will see an option to Activate, against all the repos Drone has been provided access to)
- Repositories -> < YOUR_FORKED_REPO >->Settings
- Add Secret as follows
	- AWS_ACCESS_KEY - < YOUR ACCESS KEY >
	- AWS_SECRET_KEY - < YOUR SECRET KEY >
    - Here, AWS_ACCESS_KEY and AWS_SECRET_KEY are the secret names, make sure the names are as is, if not find these names in .drone.yml file in the root repo and replace it with whatever you would prefer.
 - That's it, **The one push Pipeline will do all the heavy lifting i.e. Deploy to AWS and everything will be up and running**
 
 **NOTE: The Stack uses my Hosted Zone "iamsulabh.com", and it creates a CNAME Record mapped to ELB DNS NAME. So, my app is available at, http://ecs-app.iamsulabh.com. However, this will not work for you, so, you can just test as http://<YOUR_ELB_DNS_NAME (You can get ELB DNS NAME from EC2 Service -> Load Balancers).**

Below Image, depicts Nginx accesssible from ELB on Port 80.
![nginx-elb-80](https://github.com/ChaturvediSulabh/app-docker-ecs-cfn/blob/master/resources/images/Screenshot%202019-03-19%20at%2011.16.59%20PM.png)

## ARTIFACTS
- CLOUD FORMATION Tempate - templates/infrastructure.json
- CI/CD Pipeline - .drone.yml

## Why I did, What I did ?
- ECS fits better for the task and in AWS Ecosystem
- CloudFormation nicely takes care of its recsources and since, I wasn't actually doing anything outside of AWS. So, I didn't worry about vendor lock-in else would have used Terraform
- I found using nginx as better then, Writing Dockerfile for just a simple web app.
- Could have created ECR, but for simplicity sake, I chose to stick with Docker public repository
- Route53, Public ELB and Private EC2 with ECS running Containers ensures system is locked down and Attack surface is minimal

## What could be done better ?
- Ideally, KUBERNETES - create k8 cluster on kubernetes using Kops (I prefer, you may feel free to use the one you may want to). Deploy to Kubernetes cluster using CI/CD pipeline. Expose your pod using LoadBalancer service which is accessed from Route53/DNS Recordset in your hosted zone.
- Why ? Because, No vendor lock-in, More than just Container Orchestration.

## Add-Ons or call it extras (out-of-scope - Free)
- go-simple-webserver is a minimalist webserver (app) written in go
- Dockerfile - Dockerize the app and create the minimal size image of our app.
- **Next -> push this to Docker and update ./templates/infrastructure.json to use your image instead of nginx**
