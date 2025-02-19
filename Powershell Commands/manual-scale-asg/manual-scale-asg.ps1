##### -> MANUAL SCALING ######
##############################

#-> Change the size of your Auto Scaling group:

$group_name = "my-asg-1"
$capacity = 3

aws autoscaling set-desired-capacity `
	--auto-scaling-group-name $group_name `
	--desired-capacity $capacity `
	