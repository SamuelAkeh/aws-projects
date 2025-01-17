#Basic EC2 creation:

$amazon_linux = "ami-019374baf467d6601"
$keypair = "cli-demo-keypair"
$security_group = "sg-0f0b593e892ae0aaa"
$type = "t2.micro"


aws ec2 run-instances `
	--image-id  $amazon_linux `
	--instance-type $type `
	--key-name $keypair `
	--network-interfaces `
		(	"AssociatePublicIpAddress=true," +
			"DeviceIndex=0," +
			"Groups=$($security_group)"
		) 
		