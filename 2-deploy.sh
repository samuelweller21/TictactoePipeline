#!/bin/bash
set -eo pipefail
ARTIFACT_BUCKET=$(cat bucket-name.txt)
git.exe archive --format=zip HEAD > package.zip
aws.exe cloudformation package --template-file template.yml --s3-bucket $ARTIFACT_BUCKET --output-template-file out.yml
aws.exe cloudformation deploy --template-file out.yml --stack-name scorekeep --capabilities CAPABILITY_NAMED_IAM --region us-east-1
