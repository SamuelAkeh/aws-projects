asg_name="my-demo-asg-ex"

aws autoscaling delete-auto-scaling-group \
    --auto-scaling-group-name $asg_name \
    --force-delete
