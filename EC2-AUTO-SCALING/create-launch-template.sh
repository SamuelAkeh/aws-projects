aws ec2 create-launch-template \
    --launch-template-name "demo-launch-template" \
    --version-description "version 1" \
    --launch-template-data file://launch-template-data.json \
    --region eu-west-2
    
