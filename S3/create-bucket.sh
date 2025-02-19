bucket_name="codebase101-demo"
region=eu-west-2

aws s3api create-bucket \
    --bucket $bucket_name \
    --region $region \
    --create-bucket-configuration LocationConstraint=$region
