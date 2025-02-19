# AWS Auto Scaling Group with Launch Template

This repository provides a simple example of how to create and manage an AWS Auto Scaling Group using a Launch Template. The setup includes creating a Launch Template, defining an Auto Scaling Group, and cleaning up resources when no longer needed.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- Basic understanding of AWS EC2, Auto Scaling, and VPC.

## Launch Template

The Launch Template defines the configuration for the EC2 instances that will be launched by the Auto Scaling Group.

### Create Launch Template

To create a Launch Template, use the following command:

```shell
aws ec2 create-launch-template \
    --launch-template-name "demo-launch-template" \
    --version-description "version 1" \
    --launch-template-data file://launch-template-data.json \
    --region eu-west-2
```

The `launch-template-data.json` file contains the configuration for the Launch Template:

```json
{
  "NetworkInterfaces": [
    {
      "DeviceIndex": 0,
      "AssociatePublicIpAddress": true,
      "Groups": [
        "sg-06ab9a2d717aa123d"
      ],
      "DeleteOnTermination": true
    }
  ],
  "ImageId": "ami-03a725ae7d906005d",
  "InstanceType": "t2.micro"
}
```

## Auto Scaling Group

The Auto Scaling Group uses the Launch Template to automatically scale the number of EC2 instances based on demand.

### Create Auto Scaling Group

To create an Auto Scaling Group, use the following command:

```shell
asg_name="my-demo-asg-ex"
template_id="lt-0e5a033a15ddc1333"
subnet_1="subnet-0453f11ebc4a1cb95"
subnet_2="subnet-08173393a751bb1c9"
subnet_3="subnet-010678f6d83de9306"

aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name $asg_name \
    --launch-template LaunchTemplateId=$template_id \
    --min-size 1 \
    --max-size 3 \
    --vpc-zone-identifier "$subnet_1, $subnet_2, $subnet_3"
```

### Delete Auto Scaling Group

To delete the Auto Scaling Group, use the following command:

```shell
asg_name="my-demo-asg-ex"

aws autoscaling delete-auto-scaling-group \
    --auto-scaling-group-name $asg_name \
    --force-delete
```

## Cleanup

After you're done with the resources, make sure to delete the Auto Scaling Group and the Launch Template to avoid unnecessary charges.

```shell
# Delete Auto Scaling Group
asg_name="my-demo-asg-ex"
aws autoscaling delete-auto-scaling-group \
    --auto-scaling-group-name $asg_name \
    --force-delete

# Delete Launch Template
aws ec2 delete-launch-template \
    --launch-template-name "demo-launch-template" \
    --region eu-west-2
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- AWS Documentation for providing detailed guides on Auto Scaling and Launch Templates.

---

This README provides a basic guide to setting up an Auto Scaling Group with a Launch Template in AWS. For more advanced configurations, refer to the official [AWS Documentation](https://aws.amazon.com/documentation/).