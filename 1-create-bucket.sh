#!/bin/bash
set -eo pipefail
BUCKET_ID=$(dd if=/dev/random bs=8 count=1 2>/dev/null | od -An -tx1 | tr -d ' \t\n')
BUCKET_NAME=beanstalk-artifacts-$BUCKET_ID
echo $BUCKET_NAME > bucket-name.txt
aws.exe s3 mb s3://$BUCKET_NAME --region us-east-1
