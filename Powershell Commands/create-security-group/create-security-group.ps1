# Create AWS Security Group

$vpc_id = "vpc-00ff46df1ef7e285d"
$group_name = "my-sg-1"
$description = "demo security group for learning"

aws ec2 create-security-group `
	--group-name $group_name `
	--description $description `
	--vpc-id $vpc_id