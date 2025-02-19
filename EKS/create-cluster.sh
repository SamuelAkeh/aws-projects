cluster_name=prod
role_arn=arn:aws:iam::012345678910:role/eks-service-role-AWSServiceRoleForAmazonEKS-J7ONKE3BQ4PI
subnet_1=subnet-6782e71e
subnet_2=subnet-e7e761ac
sec_group=sg-6979fe18

aws eks create-cluster \
  --name $cluster_name \
  --role-arn $role_arn \
  --resources-vpc-config subnetIds=$subnet_1,$subnet_2,securityGroupIds=$sec_group
