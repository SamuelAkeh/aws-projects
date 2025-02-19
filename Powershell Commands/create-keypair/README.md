# AWS EC2 KeyPair Creation Script

This repository contains a simple script to create an AWS EC2 KeyPair using the AWS CLI. The KeyPair is used for securely accessing EC2 instances. This script will allow you to generate a new KeyPair for your EC2 instances.

## Prerequisites

Before running the script, ensure the following:

1. **AWS CLI Installed**: Ensure that you have the AWS CLI installed on your system. If not, follow the instructions on the official [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
2. **AWS Credentials Configured**: Make sure your AWS credentials (access key ID and secret access key) are configured using `aws configure` or environment variables.
3. **IAM Permissions**: Ensure your IAM user has the necessary permissions to create an EC2 KeyPair. The policy required is `ec2:CreateKeyPair`.

## Usage

### Step 1: Set the KeyPair Name

You can modify the script to set the desired name for your KeyPair. By default, the script uses `"MyKeyPair"` as the KeyPair name.

```bash
$key_name = "MyKeyPair"
```

### Step 2: Create the KeyPair

Run the following command to create the KeyPair using the AWS CLI. The command will generate a `.pem` file that you will use to connect to EC2 instances.

```bash
aws ec2 create-key-pair --key-name $key_name
```

This will return a JSON response containing the KeyPair details, including the private key material. Ensure to save the private key material securely, as it will not be retrievable again.

### Example Output:

```json
{
    "KeyName": "MyKeyPair",
    "KeyFingerprint": "ab:cd:ef:gh:ij:kl:mn:op:qr:st:uv:wx:yz",
    "Material": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqh...<private_key_material>...5t4oMgfcdV3zgTt0zxlNckFjszA7T5zFpA==\n-----END PRIVATE KEY-----\n"
}
```

### Step 3: Save the Private Key

The private key will be part of the output. Save it securely as a `.pem` file. This file is used for SSH access to your EC2 instances.

**Important:** If you don't save the private key at this stage, you will not be able to download it again.

## Security Note

Keep your private key secure and do not expose it in public repositories or to unauthorized personnel. If your private key is compromised, you should immediately revoke the KeyPair and generate a new one.

## Troubleshooting

- **Permission Denied**: Ensure that your IAM user has the `ec2:CreateKeyPair` permission.
- **CLI Configuration**: Double-check that your AWS CLI is properly configured with valid credentials.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.