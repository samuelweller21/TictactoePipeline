#!/bin/bash
set -eo pipefail
aws.exe cloudformation delete-stack --stack-name scorekeep --region us-east-1
echo "Deleted function stack"
if [ -f bucket-name.txt ]; then
    ARTIFACT_BUCKET=$(cat bucket-name.txt)
    while true; do
        read -p "Delete deployment artifacts and bucket ($ARTIFACT_BUCKET)?" response
        case $response in
            [Yy]* ) aws.exe s3 rb --force s3://$ARTIFACT_BUCKET; rm bucket-name.txt; break;;
            [Nn]* ) break;;
            * ) echo "Response must start with y or n.";;
        esac
    done
fi
rm -f out.yml out.json package.zip
rm -rf build .gradle build
