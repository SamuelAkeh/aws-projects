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
