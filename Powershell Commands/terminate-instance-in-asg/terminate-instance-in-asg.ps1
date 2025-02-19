#-> Terminate an instance in your Auto Scaling group:

$instance_id = i-026e4c9f62c3e448c

aws autoscaling terminate-instance-in-auto-scaling-group `
  --instance-id $instance_id `
  --should-decrement-desired-capacity
