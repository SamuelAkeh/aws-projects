vol_id=vol-059bb09b4186ea3ae

aws ec2 create-snapshot \
  --volume-id $vol_id \
  --description "This is my demo volume snapshot"
