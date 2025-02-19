# AWS ECS Fargate Sample Project

This project demonstrates how to create, manage, and delete an Amazon ECS (Elastic Container Service) cluster using Fargate launch type. The example includes creating a cluster, registering a task definition, creating a service, and cleaning up resources.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- A valid AWS account with IAM roles and permissions to create and manage ECS resources.
- Subnet and Security Group IDs for the VPC configuration.

## Steps to Deploy the Sample ECS Fargate Service

### 1. Create an ECS Cluster

First, create an ECS cluster named `MyCluster`:

```bash
aws ecs create-cluster --cluster-name MyCluster
```

### 2. Register a Task Definition

Next, register a task definition using the provided JSON file (`httpd-task-def.json`). This task definition will run an Apache HTTP server container.

```bash
aws ecs register-task-definition --cli-input-json file://httpd-task-def.json
```

#### Task Definition File (`httpd-task-def.json`)

```json
{
  "family": "sample-fargate",
  "networkMode": "awsvpc",
  "taskRoleArn": "arn:aws:iam::aws_account_id:role/execCommandRole",
  "containerDefinitions": [
    {
      "name": "fargate-app",
      "image": "public.ecr.aws/docker/library/httpd:latest",
      "portMappings": [
        {
          "containerPort": 80,
          "hostPort": 80,
          "protocol": "tcp"
        }
      ],
      "essential": true,
      "entryPoint": [
        "sh",
        "-c"
      ],
      "command": [
        "/bin/sh -c \"echo '<html> <head> <title>Amazon ECS Sample App</title> <style>body {margin-top: 40px; background-color: #333;} </style> </head><body> <div style=color:white;text-align:center> <h1>Amazon ECS Sample App</h1> <h2>Congratulations!</h2> <p>Your application is now running on a container in Amazon ECS.</p> </div></body></html>' >  /usr/local/apache2/htdocs/index.html && httpd-foreground\""
      ]
    }
  ],
  "requiresCompatibilities": [
    "FARGATE"
  ],
  "cpu": "256",
  "memory": "512"
}
```

### 3. List Task Definitions

You can list all registered task definitions to verify that your task definition was created successfully:

```bash
aws ecs list-task-definitions
```

### 4. Create an ECS Service

Create an ECS service using the task definition you registered. Replace `subnet-abcd1234` and `sg-abcd1234` with your actual subnet and security group IDs.

```bash
aws ecs create-service \
  --cluster fargate-cluster \
  --service-name fargate-service \
  --task-definition sample-fargate:1 \
  --desired-count 1 \
  --launch-type "FARGATE" \
  --network-configuration "awsvpcConfiguration={subnets=[subnet-abcd1234],securityGroups=[sg-abcd1234],assignPublicIp=ENABLED}"
```

### 5. Delete the ECS Service

To clean up, delete the ECS service:

```bash
aws ecs delete-service \
  --cluster fargate-cluster \
  --service fargate-service \
  --force
```

### 6. Delete the ECS Cluster

Finally, delete the ECS cluster:

```bash
aws ecs delete-cluster --cluster MyCluster
```

## Notes

- Ensure that the IAM role specified in `taskRoleArn` has the necessary permissions to execute commands in the container.
- The `subnet-abcd1234` and `sg-abcd1234` placeholders should be replaced with your actual subnet and security group IDs.
- The `desired-count` parameter in the `create-service` command specifies the number of tasks to run. Adjust this value as needed.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


---

This README provides a step-by-step guide to deploying a simple ECS Fargate service using AWS CLI commands. Adjust the configurations as needed for your specific use case.