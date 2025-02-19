# AWS EC2 Volume and Snapshot Management Scripts

This repository contains a set of AWS CLI commands to manage EC2 volumes and snapshots, including creating, deleting, and snapshotting volumes. Below is a guide on how to use these commands.

## Prerequisites

- AWS CLI installed and configured with the necessary permissions.
- AWS account with access to EC2 services.

## Commands

### Create an EC2 Volume

To create a new EC2 volume in a specific availability zone:

```bash
aws ec2 create-volume \
    --volume-type gp3 \
    --size 80 \
    --region eu-west-2 \
    --availability-zone eu-west-2a
```

### Create a Snapshot of an EC2 Volume

To create a snapshot of an existing EC2 volume:

```bash
vol_id=vol-0635802341597976f

aws ec2 create-snapshot \
  --volume-id $vol_id \
  --description "This is my demo volume snapshot"
```

### Delete an EC2 Snapshot

To delete an existing EC2 snapshot:

```bash
aws ec2 delete-snapshot --snapshot-id snap-078f6b33e2ff11563
```

### Delete an EC2 Volume

To delete an existing EC2 volume:

```bash
vol_id=vol-0635802341597976f

aws ec2 delete-volume --volume-id $vol_id
```


## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
