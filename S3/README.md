# S3 Bucket Management Scripts

This repository contains a set of AWS CLI commands to manage S3 buckets, including creating, listing, and deleting buckets, as well as managing objects and access points within those buckets. Below is a guide on how to use these commands.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- AWS account with access to S3 and S3 Control services.

## Commands

### Create an S3 Bucket

To create a new S3 bucket in a specific region:

```bash
bucket_name="codebase101-demo"
region=eu-west-2

aws s3api create-bucket \
    --bucket $bucket_name \
    --region $region \
    --create-bucket-configuration LocationConstraint=$region
```

### List All S3 Buckets

To list all S3 buckets in your AWS account:

```bash
aws s3api list-buckets --query "Buckets[].Name"
```

### List Objects in a Bucket

To list all objects within a specific S3 bucket:

```bash
bucket_name="codebase101-demo"

aws s3api list-objects-v2 --bucket $bucket_name
```

### Delete All Objects in a Bucket

To delete all objects within a specific S3 bucket:

```bash
bucket_name="codebase101-demo"

aws s3 rm s3://$bucket_name --recursive
```

### Create an S3 Access Point

To create an S3 access point for a specific bucket:

```bash
aws s3control create-access-point \
    --account-id 123456789012 \
    --bucket codebase-demo \
    --name demo-ap
```

### Delete an S3 Access Point

To delete an S3 access point:

```bash
aws s3control delete-access-point \
    --account-id 123456789012 \
    --name demo-ap
```

### Delete an S3 Bucket

To delete an S3 bucket:

```bash
bucket_name="codebase101-demo"
region=eu-west-2

aws s3api delete-bucket \
  --bucket $bucket_name \
  --region $region
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
