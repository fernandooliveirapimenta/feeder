#!/bin/bash
ng build --prod
aws s3 rm s3://static-feeder-app/ --recursive
aws s3 cp dist/feeder/ s3://static-feeder-app/ --recursive
aws cloudfront create-invalidation --distribution-id 'E1WSL5LF2QJXQJ' --paths '/*'
