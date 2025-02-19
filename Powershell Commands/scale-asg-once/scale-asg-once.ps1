#-> Scale one time only:

$action_name = "my-one-time-action"
$asg_name = "my-asg"
$start_time = "2021-03-31T08:00:00Z"
$capacity = 3
	
aws autoscaling put-scheduled-update-group-action `
	--scheduled-action-name $action_name `
	--auto-scaling-group-name $asg_name `
	--start-time $start_time `
	--desired-capacity $capacity
	