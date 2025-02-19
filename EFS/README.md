# AWS EFS (Elastic File System) Management Scripts

This repository contains a set of AWS CLI commands to manage Elastic File Systems (EFS), including creating and deleting file systems. Below is a guide on how to use these commands.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- AWS account with access to EFS services.

## Commands

### Create an EFS File System

To create a new EFS file system with general-purpose performance mode, bursting throughput mode, and encryption enabled:

```bash
aws efs create-file-system \
    --performance-mode generalPurpose \
    --throughput-mode bursting \
    --encrypted \
    --tags Key=Name,Value=demo-file-system
```

### Delete an EFS File System

To delete an existing EFS file system by specifying its file system ID:

```bash
aws efs delete-file-system \
    --file-system-id fs-c7a0456e
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

