# Authorize AWS Security Group

$group_id = "sg-preview-1"

aws ec2 authorize-security-group-ingress `
	--group-id $group_id `
	--ip-permissions `
		( 
			"IpProtocol=tcp, " +
			"FromPort=22, " +
			"ToPort=22, " +
			"IpRanges=[{" +
				"CidrIp=0.0.0.0/0" +
			"}]"
		)