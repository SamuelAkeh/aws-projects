# Connection Protocol to EC2 Instance:

$key_pair_file = "/path/key-pair-name.pem"
$instance_user_name = ec2-user
$instance_public_dns_name = ec2-35-177-110-163.eu-west-2.compute.amazonaws.com

ssh -i $key_pair_file $instance_user_name@$instance_public_dns_name
