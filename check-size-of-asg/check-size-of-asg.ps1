#-> Verify the size of your Auto Scaling group:

$asg_name = my-asg

aws autoscaling describe-auto-scaling-groups `
	--auto-scaling-group-name $asg_name
	