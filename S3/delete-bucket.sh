bucket_name="codebase101-demo"
region=eu-west-2

aws s3api delete-bucket \
  --bucket $bucket_name \
  --region $region
