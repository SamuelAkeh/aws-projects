#-> Scaling on a recurring schedule:

$action_name = my-recurring-action-name
$asg_name = my-asg
$recurrence = "0 9 * * *"
$capacity = 3
	

aws autoscaling put-scheduled-update-group-action `
	--scheduled-action-name $action_name `
	--auto-scaling-group-name $asg_name `
	--recurrence $recurrence `
	--desired-capacity $capacity
	